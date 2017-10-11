package com.DBaccess.DAO;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.DBaccess.Domains.Advertisement;

@Repository
public class AdvertisementDAO extends CommonDAO {

	public AdvertisementDAO() {
        super();
    }

    public boolean create(Advertisement advertisement) throws RuntimeException {
        return super.save(advertisement);
    }

	@SuppressWarnings("unchecked")
	public List<Advertisement> getDetails() throws RuntimeException{
      return (List<Advertisement>) super.findAll(Advertisement.class);
    }
	
	public boolean deleteAll() throws RuntimeException {
        List<Advertisement> advertisements = getDetails();
        boolean isDelete = true;
        for (Advertisement ad : advertisements) {
        	isDelete = isDelete && super.delete(ad);
		}
        return isDelete;
    }
}
