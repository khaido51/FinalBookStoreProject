package book.store.entity;

public class BookAuthor {
	private int id;
	private Book isbn;
	private Author authodId;
	
	
	public BookAuthor() {
		super();
	}

	public BookAuthor(int id, Book isbn, Author authodId) {
		super();
		this.id = id;
		this.isbn = isbn;
		this.authodId = authodId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getIsbn() {
		return isbn;
	}

	public void setIsbn(Book isbn) {
		this.isbn = isbn;
	}

	public Author getAuthodId() {
		return authodId;
	}

	public void setAuthodId(Author authodId) {
		this.authodId = authodId;
	}

}
