package com.DBaccess.Domains;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "TABLE_ROTATOR")
public class Rotator {

	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
    @SequenceGenerator(name = "gen", sequenceName = "TABLE_ROTATOR_SEQ")
	@Column(name="TABLE_ROTATOR_ID")
	private long rotatorId;
	
    @OneToOne
	@JoinColumn(name = "BUSINESS_ID")
	private Business business;
    
	private String header;

	public Rotator() {}
	
	public long getRotatorId() {
		return rotatorId;
	}

	public void setRotatorId(long rotatorId) {
		this.rotatorId = rotatorId;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}
}
