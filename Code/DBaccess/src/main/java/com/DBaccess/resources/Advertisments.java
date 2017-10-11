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
import com.DBaccess.DAO.AdvertisementDAO;
import com.DBaccess.Domains.Advertisement;

@Component
@Path("") 
public class Advertisments {

	@Autowired
	private AdvertisementDAO advertisementDAO;
	
	@GET
	@Path("advertisements") // http://localhost:8081/DBaccess/webapi/advertisements
	@Produces(MediaType.APPLICATION_JSON)
	public List<Advertisement> getAdvertisements() {
		 return advertisementDAO.getDetails();
	}
	
	@POST
	@Path("auth/advertisements")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createAllAdvertisements(List<Advertisement> advertisements) {
		boolean isUpdateInsertSuccess = true;
		for (Advertisement ad : advertisements) {
			isUpdateInsertSuccess = isUpdateInsertSuccess && advertisementDAO.create(ad);
		}
		return isUpdateInsertSuccess == true ? Response.status(Response.Status.OK).build() : Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
	}
	
	/*@PUT
	@Path("auth/advertisements/{advertisementId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Advertisement updateAdvertisements(@PathParam("advertisementId") long advertisementId , Advertisement advertisement) {
		advertisement.setAdvertisementId(advertisementId);;
		advertisementDAO.update(advertisement);
		return advertisement;
	}*/
	
	@DELETE
	@Path("auth/advertisements")
	@Produces(MediaType.APPLICATION_JSON)
	
	public Response removeAllAdvertisements() {
		 boolean deleteStatus = advertisementDAO.deleteAll();
		return deleteStatus == true ? Response.status(Response.Status.OK).build() : Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
	}
}
