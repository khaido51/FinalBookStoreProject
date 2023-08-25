package book.store.entity;

import java.util.Date;

public class Order {
	private int id;
	private Date dateOfOrder;
	private double totalPrice;
	private int customerId;

	public Order() {
		super();
	}
	
	public Order(int customerId, double totalPrice) {
		super();
		this.customerId = customerId;
		this.totalPrice = totalPrice;
	
	}

	public Order(int id, Date dateOfOrder, double totalPrice, int customerId) {
		super();
		this.id = id;
		this.dateOfOrder = dateOfOrder;
		this.totalPrice = totalPrice;
		this.customerId = customerId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateOfOrder() {
		return dateOfOrder;
	}

	public void setDateOfOrder(Date dateOfOrder) {
		this.dateOfOrder = dateOfOrder;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	
	
}
