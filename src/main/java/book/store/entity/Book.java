package book.store.entity;

import java.util.Date;

public class Book {
	private int isbn;
	private String title;
	private double price;
	private int edition;
	private int stock;
	private String publisher;
	private String subtitle;
	private String dimension;
	private String language;
	private String series;
	private String format;
	private String publicdate;
	private String description;
	private int page;
	private String authorName;
	private String imglink;

	
	public String getImglink() {
		return imglink;
	}



	public void setImglink(String imglink) {
		this.imglink = imglink;
	}



	public Book(int isbn) {
		super();
		this.isbn = isbn;
	}



	public Book(int isbn, String title, double price) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.price = price;
	}





	public String getPublisher() {
		return publisher;
	}

	public Book(int isbn, String title, double price, int edition, int stock, String publisher, String subtitle,
			String dimension, String language, String series, String format, String publicdate, String description,
			int page, String imglink) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.price = price;
		this.edition = edition;
		this.stock = stock;
		this.publisher = publisher;
		this.subtitle = subtitle;
		this.dimension = dimension;
		this.language = language;
		this.series = series;
		this.format = format;
		this.publicdate = publicdate;
		this.description = description;
		this.page = page;
		this.imglink = imglink;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getPublicdate() {
		return publicdate;
	}

	public void setPublicdate(String publicdate) {
		this.publicdate = publicdate;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Book() {
		super();
	}

	public String getAuthorName() {
		return authorName;
	}



	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}



	public Book(int isbn, String title, double price, String authorName) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.price = price;
		this.authorName = authorName;
	}



	public Book(int isbn, String title, double price, int edition, int stock,String description) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.price = price;
		this.edition = edition;
		this.stock = stock;
		this.description=description;
	
	}
	
	

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
