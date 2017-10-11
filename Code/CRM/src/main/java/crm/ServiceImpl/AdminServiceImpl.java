package crm.ServiceImpl;

import java.util.List;

import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Service;

import crm.WebServiceUtil;
import crm.Domain.Advertisement;
import crm.Domain.Business;
import crm.Domain.ChamberInfo;
import crm.Domain.Rotator;
import crm.Service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	WebTarget adminTarget = WebServiceUtil.getBaseAuthURL();
	WebTarget guestTarget = WebServiceUtil.getBaseURL();
	
	/* ------------------------ Chamber Info Start------------------------ */
	
	WebTarget chamberTargetWithoutAuth = guestTarget.path("chambers");
	WebTarget chamberTargetWithAuth = adminTarget.path("chambers");

	@Override
	public ChamberInfo getChamberInfo() {
		Response response = chamberTargetWithoutAuth.request(MediaType.APPLICATION_JSON).get();
		return response.getStatus()==200 ? response.readEntity(ChamberInfo.class) : null ;
	}

	@Override
	// auth/chambers/{chamberId}
	public boolean updateChamberInfo(ChamberInfo chamberInfo) {
		WebTarget updateChamberTarget = chamberTargetWithAuth.path("/{chamberId}").resolveTemplate("chamberId", chamberInfo.getChamberInfoId());
		Response response = updateChamberTarget.request(MediaType.APPLICATION_JSON)
				.header(HttpHeaders.AUTHORIZATION, WebServiceUtil.getBasicAuthForHeader())
				.put(Entity.json(chamberInfo));
		
		return response.getStatus()==200 ? true : false; 
	}
	
	/* ------------------------ Chamber Info End------------------------ */
	
	/* ------------------------ Website Rotator Start------------------------ */
	
	WebTarget rotatorTargetWithoutAuth = guestTarget.path("rotators");
	WebTarget rotatorTargetWithAuth = adminTarget.path("rotators");
	
	@Override
	public List<Rotator> getWebsiteRotatorDetails() {
		List<Rotator> rotators = rotatorTargetWithoutAuth.request(MediaType.APPLICATION_JSON).get(new GenericType<List<Rotator>>(){});
		return rotators;
	}

	@Override
	public boolean removeAllWebsiteRotators() {
		Response response = rotatorTargetWithAuth.request()
							.header(HttpHeaders.AUTHORIZATION, WebServiceUtil.getBasicAuthForHeader())
							.delete();
		
		return response.getStatus()==200 ? true : false; 
	}

	@Override
	public boolean saveAllWebsiteRotators(List<Rotator> rotators) {
		
		GenericEntity<List<Rotator>> rotatorEntity = new GenericEntity<List<Rotator>>(rotators) {};
		
		Response response = rotatorTargetWithAuth.request()
				.header(HttpHeaders.AUTHORIZATION, WebServiceUtil.getBasicAuthForHeader())
				.post(Entity.json(rotatorEntity));
		
		return response.getStatus()==200 ? true : false; 
	}
	
	
	WebTarget businessTargetWithoutAuth = guestTarget.path("businesses");
	
	@Override
	public List<Business> getBusinessDetails() {
		List<Business> businesses = businessTargetWithoutAuth.request(MediaType.APPLICATION_JSON).get(new GenericType<List<Business>>(){});
		return businesses;
	}
	/* ------------------------ Website Rotator End------------------------ */
	
	/* ------------------------ Advertisement Start------------------------ */
	
	WebTarget advertisementTargetWithoutAuth = guestTarget.path("advertisements");
	WebTarget advertisementTargetWithAuth = adminTarget.path("advertisements");
	
	@Override
	public List<Advertisement> getAdvertisements() {
		List<Advertisement> advertisements = advertisementTargetWithoutAuth.request(MediaType.APPLICATION_JSON).get(new GenericType<List<Advertisement>>(){});
		return advertisements;
	}
	
	/* ------------------------ Advertisement End------------------------ */
}