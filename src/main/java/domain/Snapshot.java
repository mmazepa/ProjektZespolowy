package domain;

public class Snapshot {
	private int id = 0;
	private int author = 0;
	private int file = 0;
	private String name = "";
	private String creationDate = "1970-01-01";
	private String content = "";
	
	public Snapshot() {
		super();
	}

	public Snapshot(int id, int author, int file, String name,
			String creationDate, String content) {
		super();
		this.id = id;
		this.author = author;
		this.file = file;
		this.name = name;
		this.creationDate = creationDate;
		this.content = content;
	}

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public int getAuthor() {
		return author;
	}

	public void setAuthor(int author) {
		this.author = author;
	}

	public int getFile() {
		return file;
	}

	public void setFile(int file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
