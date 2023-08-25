package book.store.entity;

public class Wishlist {
	private int id;
	private int book_isbn;
	private int customer_id;
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
	public Wishlist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Wishlist(int id, int book_isbn, int customer_id) {
		super();
		this.id = id;
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
	}
	public Wishlist(int book_isbn, int customer_id) {
		super();
		this.book_isbn = book_isbn;
		this.customer_id = customer_id;
	}

}
