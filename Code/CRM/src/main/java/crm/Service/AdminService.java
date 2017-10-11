package crm.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import crm.Domain.Advertisement;
import crm.Domain.Business;
import crm.Domain.ChamberInfo;
import crm.Domain.Rotator;

@Service
public interface AdminService {
	
	public ChamberInfo getChamberInfo ();
	public boolean updateChamberInfo(ChamberInfo chamberInfo);
	
	public List<Rotator> getWebsiteRotatorDetails();
	public boolean removeAllWebsiteRotators();
	public boolean saveAllWebsiteRotators(List<Rotator> rotators);
	public List<Business> getBusinessDetails();
	
	public List<Advertisement> getAdvertisements();
	
}