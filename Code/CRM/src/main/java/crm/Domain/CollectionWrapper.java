package crm.Domain;

import java.util.List;

public class CollectionWrapper {
	
	private List<Advertisement> advertisements;
	private List<Business> businesses;

	public CollectionWrapper() {}
	public List<Advertisement> getAdvertisements() {
		return advertisements;
	}

	public void setAdvertisements(List<Advertisement> advertisements) {
		this.advertisements = advertisements;
	}

	public List<Business> getBusinesses() {
		return businesses;
	}

	public void setBusinesses(List<Business> businesses) {
		this.businesses = businesses;
	}
}
