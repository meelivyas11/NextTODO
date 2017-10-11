package com.DBaccess.resources;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.ContactDAO;
import com.DBaccess.Domains.Contact;


// http://localhost:8081/DBaccess/webapi/auth/contacts
@Component
@Path("")
public class Contacts {

	@Autowired
	private ContactDAO contactDao;
	
	@GET
	@Path("auth/contacts")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Contact> getUsers() {
		 return contactDao.findAll();
	}
	
	@POST
	@Path("auth/contacts")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Contact add(Contact u) {
		Contact user = new Contact();
		user.setUserName(u.getUserName());
		user.setPassword(u.getPassword());
		
		contactDao.create(user);
		
		return u;
	}
	
	// Delete me if you remove CRM project
	@POST
	@Path("auth/contacts/validate")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Contact authenticateUser(Contact u) {
		Contact validUser = contactDao.find(u.getUserName(), u.getPassword());
		return validUser;
	}
	
	// used by CRMApp project
	@POST
	@Path("contacts/validate")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Contact authenticateUserDetails(Contact u) {
		Contact validUser = contactDao.find(u.getUserName(), u.getPassword());
		return validUser;
	}
}
