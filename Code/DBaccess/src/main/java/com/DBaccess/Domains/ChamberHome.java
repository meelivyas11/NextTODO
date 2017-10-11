package com.DBaccess.Domains;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "HOME_PAGE")
public class ChamberHome {

	@Id 
	@Column(name="HOME_PAGE_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
    @SequenceGenerator(name = "gen", sequenceName = "HOME_PAGE_SEQ")
	private long chamberHomeId;
	
    @OneToOne
    @JoinColumn(name = "CHAMBER_INFO_ID")
	private ChamberInfo chamberInfo;
	
    @Lob
	@Column(name="IMAGE")
	private byte[] homePageImg;
	
	public ChamberHome() {}

	public long getChamberHomeId() {
		return chamberHomeId;
	}

	public void setChamberHomeId(long chamberHomeId) {
		this.chamberHomeId = chamberHomeId;
	}

	public ChamberInfo getChamberInfo() {
		return chamberInfo;
	}

	public void setChamberInfo(ChamberInfo chamberInfo) {
		this.chamberInfo = chamberInfo;
	}

	public byte[] getHomePageImg() {
		return homePageImg;
	}

	public void setHomePageImg(byte[] homePageImg) {
		this.homePageImg = homePageImg;
	}
}
