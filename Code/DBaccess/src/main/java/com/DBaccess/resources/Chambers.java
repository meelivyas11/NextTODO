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

import com.DBaccess.DAO.ChamberInfoDAO;
import com.DBaccess.Domains.ChamberInfo;

@Component
@Path("") 
public class Chambers {

	@Autowired
	private ChamberInfoDAO chamberInfoDao;
	
	@GET
	@Path("chambers") // http://localhost:8081/DBaccess/webapi/chambers
	@Produces(MediaType.APPLICATION_JSON)
	public ChamberInfo getChamber() {
		 return chamberInfoDao.getDetails();
	}
	
	@PUT
	@Path("auth/chambers/{chamberId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public ChamberInfo updateChamberInfo(@PathParam("chamberId") long chamberId , ChamberInfo chamberInfo) {
		chamberInfo.setChamberInfoId(chamberId);
		chamberInfoDao.update(chamberInfo);
		return chamberInfo;
	}
	
}
