package com.DBaccess.resources;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.BusinessDAO;
import com.DBaccess.Domains.Business;

@Component
@Path("") 
public class Businesses {

	@Autowired
	private BusinessDAO businessDao;
	
	@GET
	@Path("businesses") // http://localhost:8081/DBaccess/webapi/businesses
	@Produces(MediaType.APPLICATION_JSON)
	public List<Business> getBusinessDetails() {
		 return businessDao.getDetails();
	}
}
