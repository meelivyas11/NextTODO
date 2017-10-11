package crm.Domain;

public class ChamberInfo {
		
	private long chamberInfoId;
	private String name;
	private String address;
	private String city;
	private String state;
	private String facebookURL;
	private String twitterURL;
	private String linkedInURL;
	private byte[] logo;
	private byte[] homePageImg;
	
	public ChamberInfo() {}

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

	public byte[] getLogo() {
		return logo;
	}

	public void setLogo(byte[] logo) {
		this.logo = logo;
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

	public byte[] getHomePageImg() {
		return homePageImg;
	}

	public void setHomePageImg(byte[] homePageImg) {
		this.homePageImg = homePageImg;
	}

}
