package com.DBaccess.Util;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.DBaccess.DAO.ChamberInfoDAO;
import com.DBaccess.DAO.ContactDAO;
import com.DBaccess.DAO.RotatorDAO;

@Configuration
@ComponentScan({"com.DBaccess"})
public class SpringConfig {
	
	@Bean
	public ContactDAO contactDAO() {
		return new ContactDAO();
	}
	
	@Bean
	public ChamberInfoDAO chamberInfoDAO() {
		return new ChamberInfoDAO();
	}
	
	@Bean
	public RotatorDAO rotatorDAO() {
		return new RotatorDAO();
	}
	
}