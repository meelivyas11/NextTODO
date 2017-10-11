angular.module('CRMApp')
	
	//enumerate authorization and authentication events
	.constant('AuthEvents', {
	    authorized: 'authorized',
	    notAuthorized: 'notauthorized',
	    authenticated: 'authenticated',
	    notAuthenticated: 'notauthenticated'
	})

	// enumerate user roles
	.constant('ContactRoles', {
        chamberStaff: 'ChamberStaff',
        businessAdmin: 'BusinessAdmin',
        businessUserEventPosting: 'BusinessUserEventPosting',
        businessUserJobPosting: 'BusinessUserJobPosting',
        businessUserUpdateWebsite: 'BusinessUserUpdateWebsite',
        businessUserMemberNews: 'BusinessUserMemberNews',
        contact: 'Contact'
    })
    
    .service('auth', ['$http', '$q', '$window', '$location', '$rootScope', '$route', 'AuthEvents', 'ContactRoles', 'session',
            function ($http, $q, $window, $location, $rootScope, $route, AuthEvents, ContactRoles, session) {
               
    			var self = this, pendingInit;

                // determines if the user is authenticated
                self.isAuthenticated = function () {
                    return !!session.getUser();
                };

                // determines the user's authorization status for the given role
                self.isAuthorized = function (authorizedRoles) {
                  
                	// if there are no authorized roles, then the route is misconfigured
                    if (!authorizedRoles) {
                        throw new Error("No authorized roles provided; possible misconfigured route.");
                    }

                    if (self.isAuthenticated()) {
                        // process auth as normal
                        var deferred = $q.defer();
                        deferred.resolve($rootScope.hasRole(authorizedRoles));
                        return deferred.promise;
                    }

                    // handle possible pending initialization
                    if (pendingInit && !self.isAuthenticated()) {
                        return pendingInit.promise;
                    }

                    // begin initialization
                    pendingInit = $q.defer();

                    return pendingInit.promise;
                };

                // send unauthorized users to the not authorized view
                $rootScope.$on('notauthorized', function () {
                	console.log('User not authorized!');
                    $location.path('Error/NotAuthorized');
                });
                
             // send unauthorized users to the not authorized view
                $rootScope.$on('notauthenticated', function () {
                    console.log('User is not Authenticated!!');
                    $location.path('/');
                });

                // handle route change errors
                $rootScope.$on('$routeChangeError', function () {
                    $location.path('Error/NotFound');
                });

                // authorize users for individual route changes
                $rootScope.$on('$locationChangeStart', function () {
                    // get route data for the route in question
                    var routeData = null;
                    for (var route in $route.routes) {
                        if ($location.path().match($route.routes[route].regexp)) {
                            routeData = $route.routes[route].data;
                            break;
                        }
                    }
                    
                    // if the route has declared authorized roles then authorize user, otherwise everyone has access
                    if (routeData) {
                        self.isAuthorized(routeData.authorizedRoles).then(
                            function (result) {
                            	AuthResult(result);
                            },
                            function (result) {
                                $rootScope.$emit(result.event);
                            });
                    }
                });

                function AuthResult(isAuthorized) {
                    this.isAuthorized = isAuthorized;
                    this.event = isAuthorized ? AuthEvents.authorized : AuthEvents.notAuthorized;
                    $rootScope.$emit(this.event)
                }

                // Putting this method on the rootscope so other controllers can access it. Maybe it can be on
                // self(this) and then where this service is injected call the local function.
                $rootScope.hasRole = function (authorizedRoles) {
                    var userAuthorized = false;
                    if (session.getUser()) {
                    	//console.log(session.getUser().roles);
                        if (session.getUser().roles) {
                            // convert to an array, if necessary
                            if (!angular.isArray(authorizedRoles)) {
                                authorizedRoles = [authorizedRoles];
                            }
                             
                            authorizedRoles.forEach(function (authorizedRole) {
                                if (userAuthorized) {
                                    return;
                                }
                                var matches = session.getUser().roles.filter(function (userRole) {
                                    return userRole === authorizedRole;
                                });
                                userAuthorized = matches.length ? true : false;
                            });
                        }
                    }
                    return userAuthorized;
                };

                return self;
            }
    ]);