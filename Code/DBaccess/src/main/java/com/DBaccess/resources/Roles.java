package com.DBaccess.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.RoleDAO;
import com.DBaccess.Domains.Role;

@Component
@Path("auth/roles/") 
public class Roles {

	@Autowired
	private RoleDAO roleDao;
	
	@GET
	@Path("{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Role getRolesForContactId(@PathParam("userId") long userId) {
		return roleDao.getRolesForContactId(userId);
	}
	
}
