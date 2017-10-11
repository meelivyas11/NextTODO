package com.DBaccess.Domains;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "ROLES")
public class Role {

	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
    @SequenceGenerator(name = "gen", sequenceName = "ROLES_SEQ")
	@Column(name="ROLE_ID")
	private long roleId;
	
	@Column(name="CONTACT_ID")
	private long contactId;
	
	@Column(name="BUSINESS_ADMIN", length=1, columnDefinition="CHAR")
	private String isBusinessAdmin;
	
	@Column(name="BUSINESS_USER_EVENT_POSTING", length=1, columnDefinition="CHAR")
	private String isBusinessUserEventPosting;
	
	@Column(name="BUSINESS_USER_JOB_POSTING", length=1, columnDefinition="CHAR")
	private String isBusinessUserJobPosting;
	
	@Column(name="BUSINESS_USER_UPDATE_WEBSITE", length=1, columnDefinition="CHAR")
	private String isBusinessUserUpdateWebsite;
	
	@Column(name="BUSINESS_USER_MEMBER_NEWS", length=1, columnDefinition="CHAR")
	private String isBusinessUserMemberNews;
	
	@Column(name="CHAMBER_STAFF", length=1, columnDefinition="CHAR")
	private String isChamberStaff;
	
	@Column(name="CONTACT", length=1, columnDefinition="CHAR")
	private String isContact;
	
	public Role() {}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	
	public long getContactId() {
		return contactId;
	}

	public void setContactId(long contactId) {
		this.contactId = contactId;
	}

	public String getIsBusinessAdmin() {
		return isBusinessAdmin;
	}

	public void setIsBusinessAdmin(String isBusinessAdmin) {
		this.isBusinessAdmin = isBusinessAdmin;
	}

	public String getIsBusinessUserEventPosting() {
		return isBusinessUserEventPosting;
	}

	public void setIsBusinessUserEventPosting(String isBusinessUserEventPosting) {
		this.isBusinessUserEventPosting = isBusinessUserEventPosting;
	}

	public String getIsBusinessUserJobPosting() {
		return isBusinessUserJobPosting;
	}

	public void setIsBusinessUserJobPosting(String isBusinessUserJobPosting) {
		this.isBusinessUserJobPosting = isBusinessUserJobPosting;
	}

	public String getIsBusinessUserUpdateWebsite() {
		return isBusinessUserUpdateWebsite;
	}

	public void setIsBusinessUserUpdateWebsite(String isBusinessUserUpdateWebsite) {
		this.isBusinessUserUpdateWebsite = isBusinessUserUpdateWebsite;
	}

	public String getIsBusinessUserMemberNews() {
		return isBusinessUserMemberNews;
	}

	public void setIsBusinessUserMemberNews(String isBusinessUserMemberNews) {
		this.isBusinessUserMemberNews = isBusinessUserMemberNews;
	}

	public String getIsChamberStaff() {
		return isChamberStaff;
	}

	public void setIsChamberStaff(String isChamberStaff) {
		this.isChamberStaff = isChamberStaff;
	}

	public String getIsContact() {
		return isContact;
	}

	public void setIsContact(String isContact) {
		this.isContact = isContact;
	}
}
