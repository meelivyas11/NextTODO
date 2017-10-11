package com.DBaccess.DAO;

import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.ChamberHome;

@Repository
public class ChamberHomeDAO extends CommonDAO {

	public ChamberHomeDAO() {
        super();
    }

    public void create(ChamberHome chamberHome) throws RuntimeException {
        super.saveOrUpdate(chamberHome);
    }

    public void delete(ChamberHome chamberHome) throws RuntimeException {
        super.delete(chamberHome);
    }

    public void update(ChamberHome chamberHome) throws RuntimeException {
        super.saveOrUpdate(chamberHome);
    }

	public ChamberHome getDetails() throws RuntimeException{
		return (ChamberHome) super.findAll(ChamberHome.class).get(0);
    }
}
