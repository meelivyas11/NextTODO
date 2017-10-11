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
@Table(name = "ADVERTISEMENT")
public class Advertisement {

	@Id
	@Column(name="ADVERTISEMENT_ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
    @SequenceGenerator(name = "gen", sequenceName = "ADVERTISEMENT_SEQ")
	private long advertisementId;
	
    @OneToOne
	@JoinColumn(name = "BUSINESS_ID")
	private Business business;
    
    @Column(name="AD_URL")
	private String url;
    
    @Column(name="IMAGE")
	private byte[] image;

	public Advertisement() {}

	public long getAdvertisementId() {
		return advertisementId;
	}

	public void setAdvertisementId(long advertisementId) {
		this.advertisementId = advertisementId;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
}
