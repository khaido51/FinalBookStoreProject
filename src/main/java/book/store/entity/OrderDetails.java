package book.store.entity;

public class OrderDetails {
	private int id;
	private int orderId;
	private int bookId;
	private int amount;
	private double orderedPrice;

	public OrderDetails() {
		super();
	}
	
	public OrderDetails(int orderId, int bookId, int amount, double orderedPrice) {
		super();
		this.orderId = orderId;
		this.bookId = bookId;
		this.amount = amount;
		this.orderedPrice = orderedPrice;
		
	}

	

	public OrderDetails(int id, int orderId, int bookId, int amount, double orderedPrice) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.bookId = bookId;
		this.amount = amount;
		this.orderedPrice = orderedPrice;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getOrderedPrice() {
		return orderedPrice;
	}

	public void setOrderedPrice(double orderedPrice) {
		this.orderedPrice = orderedPrice;
	}

}
