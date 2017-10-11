package crm.Domain;

public class Rotator {

	private long rotatorId;
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
