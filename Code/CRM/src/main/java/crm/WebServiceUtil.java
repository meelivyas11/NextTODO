package crm;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import org.glassfish.jersey.internal.util.Base64;

import crm.Domain.ChamberInfo;
import crm.Domain.Contact;

public class WebServiceUtil {

	public static Client client = ClientBuilder.newClient();
	private static Contact validUser;
	private static ChamberInfo chamberInfo;

	
	public static WebTarget getBaseAuthURL() {
		return client.target("http://localhost:8081/DBaccess/webapi/auth/");
	}
	
	public static String getBasicAuthForHeader() {
		String authorizationHeaderValue = "";
		if(validUser!=null && validUser.getUserName()!=null && validUser.getPassword()!=null) {
	        String usernameAndPassword = validUser.getUserName() + ":" + validUser.getPassword();
	        authorizationHeaderValue = "Basic " + Base64.encodeAsString(usernameAndPassword);
		}
		 return authorizationHeaderValue;
	}
	
	public static String getBasicAuthForHeader(String userName, String password) {
        String usernameAndPassword = userName + ":" + password;
        String authorizationHeaderValue = "Basic " + Base64.encodeAsString(usernameAndPassword);
        return authorizationHeaderValue;
	}
	
	public static void setValidUser(Contact user) {
		validUser = user;
	}
	
	public static WebTarget getBaseURL() {
		return client.target("http://localhost:8081/DBaccess/webapi/");
	}

	public static ChamberInfo getChamberInfo() {
		return chamberInfo;
	}

	public static void setChamberInfo(ChamberInfo chamber) {
		chamberInfo = chamber;
	}
}
