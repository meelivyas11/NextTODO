package com.DBaccess.DAO;

import org.springframework.stereotype.Repository;

import com.DBaccess.Domains.ChamberInfo;

@Repository
public class ChamberInfoDAO extends CommonDAO {

	public ChamberInfoDAO() {
        super();
    }

    public void create(ChamberInfo chamberInfo) throws RuntimeException {
        super.saveOrUpdate(chamberInfo);
    }

    public void delete(ChamberInfo chamberInfo) throws RuntimeException {
        super.delete(chamberInfo);
    }

    public void update(ChamberInfo chamberInfo) throws RuntimeException {
        super.saveOrUpdate(chamberInfo);
    }

	public ChamberInfo getDetails() throws RuntimeException{
      return (ChamberInfo) super.findAll(ChamberInfo.class).get(0);
    }
}
