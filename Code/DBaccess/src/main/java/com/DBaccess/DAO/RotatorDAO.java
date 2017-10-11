package com.DBaccess.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.Rotator;

@Repository
public class RotatorDAO extends CommonDAO {

	public RotatorDAO() {
        super();
    }

    public boolean create(Rotator rotator) throws RuntimeException {
        return super.save(rotator);
    }

	@SuppressWarnings("unchecked")
	public List<Rotator> getDetails() throws RuntimeException{
      return (List<Rotator>) super.findAll(Rotator.class);
    }
	
	public boolean deleteAll() throws RuntimeException {
        List<Rotator> rotators = getDetails();
        boolean isDelete = true;
        for (Rotator r : rotators) {
        	isDelete = isDelete && super.delete(r);
		}
        return isDelete;
    }
}
