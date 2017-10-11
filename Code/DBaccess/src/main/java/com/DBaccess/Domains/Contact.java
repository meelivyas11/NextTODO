package com.DBaccess.Domains;

import javax.persistence.*;

@Entity
@Table(name = "CONTACT")
public class Contact {
	
	@Id
	@Column(name="CONTACT_ID" )
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
    @SequenceGenerator(name = "gen", sequenceName = "CONTACT_SEQ")
	private long contactId;
	@Column(name="USERNAME" )
	private String userName;
	@Column(name="PASSWORD" )
	private String password;
	@Column(name="FIRST_NAME" )
	private String firstName;
	@Column(name="MIDDLE_NAME" )
	private String middleName;
	@Column(name="LAST_NAME" )
	private String lastName;
	
	public Contact() {}
	
	public long getContactId() {
		return contactId;
	}

	public void setContactId(long contactId) {
		this.contactId = contactId;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
}
