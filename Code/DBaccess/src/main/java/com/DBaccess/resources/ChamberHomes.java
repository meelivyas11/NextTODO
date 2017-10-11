package com.DBaccess.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.ChamberHomeDAO;
import com.DBaccess.Domains.ChamberHome;

@Component
@Path("") 
public class ChamberHomes {

	@Autowired
	private ChamberHomeDAO chamberHomeDao;
	
	@GET
	@Path("chamberHomes") // http://localhost:8081/DBaccess/webapi/chamberHomes
	@Produces(MediaType.APPLICATION_JSON)
	public ChamberHome getChamber() {
		 return chamberHomeDao.getDetails();
	}
	
	@PUT
	@Path("auth/chamberHomes/{chamberHomeId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ChamberHome updateChamberInfo(@PathParam("chamberHomeId") long chamberHomeId , ChamberHome chamberHome) {
		chamberHome.setChamberHomeId(chamberHomeId);
		chamberHomeDao.update(chamberHome);
		return chamberHome;
	}
	
}
