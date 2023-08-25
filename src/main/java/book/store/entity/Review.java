package book.store.entity;

import java.util.Date;

public class Review {
	private int id;
	private int book_isbn;
	private int customer_id;
	private Date date;
	private String reviewTitle;
	private String description;
	private String userName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(int book_isbn) {
		this.book_isbn = book_isbn;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Review(int id, int book_isbn, int customer_id, Date date, String reviewTitle, String description,
			String userName) {
		super();
		this.id = id;
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
		this.date = date;
		this.reviewTitle = reviewTitle;
		this.description = description;
		this.userName = userName;
	}

	public Review(int id, int book_isbn, int customer_id, Date date, String reviewTitle, String description) {
		super();
		this.id = id;
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
		this.date = date;
		this.reviewTitle = reviewTitle;
		this.description = description;
	}

	public Review(int book_isbn, int customer_id) {
		super();
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
	}

	public Review(int book_isbn, int customer_id, String reviewTitle, String description) {
		super();
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
		this.reviewTitle = reviewTitle;
		this.description = description;
	}


}
