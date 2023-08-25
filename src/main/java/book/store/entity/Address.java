package book.store.entity;

public class Address {
	private int id;
	private int streetNo;
	private String streetName;
	private String suburb;
	private int postcode;
	private String state;
	private int customerId;
	


	public Address() {
		super();
	}
	
	public Address(int streetNo, String streetName, String suburb, int postcode, String state) {
		super();
		this.streetNo = streetNo;
		this.streetName = streetName;
		this.suburb = suburb;
		this.postcode = postcode;
		this.state = state;
	}

	public Address(int id, int streetNo, String streetName, String suburb, int postcode, String state, int customerId) {
		super();
		this.id = id;
		this.streetNo = streetNo;
		this.streetName = streetName;
		this.suburb = suburb;
		this.postcode = postcode;
		this.state = state;
		this.customerId = customerId;
	}
	
	public Address(int streetNo, String streetName, String suburb, int postcode, String state, int customerId) {
		super();
		this.streetNo = streetNo;
		this.streetName = streetName;
		this.suburb = suburb;
		this.postcode = postcode;
		this.state = state;
		this.customerId = customerId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getSuburb() {
		return suburb;
	}

	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}

	public int getPostcode() {
		return postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	@Override
	public String toString() {
		return "Address [id=" + id + ", streetNo=" + streetNo + ", streetName=" + streetName + ", suburb=" + suburb
				+ ", postcode=" + postcode + ", state=" + state + ", customerId=" + customerId + "]";
	}

}
