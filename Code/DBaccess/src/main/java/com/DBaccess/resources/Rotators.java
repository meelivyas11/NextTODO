package com.DBaccess.resources;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.DBaccess.DAO.RotatorDAO;
import com.DBaccess.Domains.Rotator;

@Component
@Path("") 
public class Rotators {

	@Autowired
	private RotatorDAO rotatorDao;
	
	@GET
	@Path("rotators") // http://localhost:8081/DBaccess/webapi/rotators
	@Produces(MediaType.APPLICATION_JSON)
	public List<Rotator> getRotators() {
		 return rotatorDao.getDetails();
	}
	
	@POST
	@Path("auth/rotators")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createAllWebsiteRotators(List<Rotator> rotator) {
		boolean isUpdateInsertSuccess = true;
		for (Rotator wr : rotator) {
			if(wr.getBusiness().getCompanyName() != null)
				isUpdateInsertSuccess = isUpdateInsertSuccess && rotatorDao.create(wr);
		}
		return isUpdateInsertSuccess == true ? Response.status(Response.Status.OK).build() : Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
	}
	
	/*@PUT
	@Path("auth/rotators/{rotatorId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Rotator updateWebsiteRotators(@PathParam("rotatorId") long rotatorId , Rotator rotator) {
		rotator.setRotatorId(rotatorId);
		rotatorDao.update(rotator);
		return rotator;
	}*/
	
	@DELETE
	@Path("auth/rotators")
	@Produces(MediaType.APPLICATION_JSON)
	public Response removeAllWebsiteRotators() {
		 boolean deleteStatus = rotatorDao.deleteAll();
		return deleteStatus == true ? Response.status(Response.Status.OK).build() : Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
	}
}
