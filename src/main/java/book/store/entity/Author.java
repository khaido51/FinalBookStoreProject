package book.store.entity;

public class Author {
	private int id;
	private String name;
	private String description;


	public Author() {
		super();
	}

	public Author(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

	public Author(int id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}