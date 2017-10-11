package com.DBaccess.Filters;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.PreMatching;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;

import org.glassfish.jersey.internal.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.ContactDAO;

@Component
@Provider
@PreMatching
public class UserAuthFilter implements ContainerRequestFilter{

	@Autowired
	private ContactDAO contactDao;
	
	@Override
	public void filter(ContainerRequestContext requestCxt) throws IOException {
		
		if (requestCxt.getMethod().equals("OPTIONS"))
        {
            Response optionsMethod = Response.status(Response.Status.OK).header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS").header("Access-Control-Allow-Headers", "Origin, Accept, Content-Type, authorization , X-Accept-Charset,X-Accept,Credentials").build();
            return;
        }
		
		System.out.println("Inside UserAuthFilter filter");
		if(requestCxt.getUriInfo().getPath().contains("auth")) {
			List<String> authHeaders = requestCxt.getHeaders().get("Authorization");
			if(authHeaders!=null && authHeaders.size() > 0) {
				String auth = authHeaders.get(0);
				auth = auth.replaceAll("Basic ", "");
				String decodedString = Base64.decodeAsString(auth);
				StringTokenizer st = new StringTokenizer(decodedString, ":");
				String username = st.nextToken();
				String password = st.nextToken();
				
				// Call DB to verify the credentials
				if(isValidUser(username,password)) {
					return;
				}
			}
			Response unauthorizedUser = Response.status(Response.Status.UNAUTHORIZED).entity("Invalid User Credentials").build();
			requestCxt.abortWith(unauthorizedUser);
		}
	}
	
	
	public boolean isValidUser(String userName, String password) {
		
		if(contactDao.find(userName, password)!=null)
			return true;
		else
			return false;
	}

}
