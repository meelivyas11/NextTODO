package com.DBaccess.Domains;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "CHAMBER_INFO")
public class ChamberInfo {
		
		@Id 
		@Column(name="CHAMBER_INFO_ID")
		@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
	    @SequenceGenerator(name = "gen", sequenceName = "CHAMBER_INFO_SEQ")
		private long chamberInfoId;
		
		private String name;
		private String address;
		private String city;
		private String state;
		private String zip;
		private String phone;
		private String fax;
		
		@Column(name="FACEBOOK_URL")
		private String facebookURL;
		
		@Column(name="TWITTER_URL")
		private String twitterURL;
		
		@Column(name="LINKEDIN_URL")
		private String linkedInURL;
		
		public ChamberInfo() {}
		
		@Lob
		private byte[] logo;
		
		public byte[] getLogo() {
			return logo;
		}

		public void setLogo(byte[] logo) {
			this.logo = logo;
		}
		
		public String getZip() {
			return zip;
		}

		public void setZip(String zip) {
			this.zip = zip;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getFax() {
			return fax;
		}

		public void setFax(String fax) {
			this.fax = fax;
		}

		public long getChamberInfoId() {
			return chamberInfoId;
		}

		public void setChamberInfoId(long chamberInfoId) {
			this.chamberInfoId = chamberInfoId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}
		
		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getFacebookURL() {
			return facebookURL;
		}

		public void setFacebookURL(String facebookURL) {
			this.facebookURL = facebookURL;
		}

		public String getTwitterURL() {
			return twitterURL;
		}

		public void setTwitterURL(String twitterURL) {
			this.twitterURL = twitterURL;
		}

		public String getLinkedInURL() {
			return linkedInURL;
		}

		public void setLinkedInURL(String linkedInURL) {
			this.linkedInURL = linkedInURL;
		}
}
