package crm.ServiceImpl;

import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Service;

import crm.WebServiceUtil;
import crm.Domain.Contact;
import crm.Service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	WebTarget eventTarget = WebServiceUtil.getBaseAuthURL().path("contacts");
	
	public Contact Login(String userName, String password) {
		
		System.out.println("We are in the Service " + userName + ":" + password);
		
		WebTarget validationTarget = eventTarget.path("validate");
		
		Contact newUser = new Contact();
		newUser.setUserName(userName);
		newUser.setPassword(password);
		
		Response response = validationTarget.request(MediaType.APPLICATION_JSON)
				.header(HttpHeaders.AUTHORIZATION, WebServiceUtil.getBasicAuthForHeader(userName,password))
				.post(Entity.json(newUser));
		
		if(response.getStatus()==200)
			return response.readEntity(Contact.class);
		else
			return null;
	}
}