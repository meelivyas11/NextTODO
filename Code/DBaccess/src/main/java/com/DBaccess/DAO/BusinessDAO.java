package com.DBaccess.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.Business;

@Repository
public class BusinessDAO extends CommonDAO {

	public BusinessDAO() {
        super();
    }

	@SuppressWarnings("unchecked")
	public List<Business> getDetails() throws RuntimeException{
      return (List<Business>) super.findAll(Business.class);
    }
	
	
}
