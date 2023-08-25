package book.store.entity;

public class BookGenre {
	private int id;
	private int bookIsbn;
	private int genreId;
	
	
	public BookGenre() {
		super();
	}

	public BookGenre(int id, int bookIsbn, int genreId) {
		super();
		this.id = id;
		this.bookIsbn = bookIsbn;
		this.genreId = genreId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookIsbn() {
		return bookIsbn;
	}
	public void setBookIsbn(int bookIsbn) {
		this.bookIsbn = bookIsbn;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	
	
}
