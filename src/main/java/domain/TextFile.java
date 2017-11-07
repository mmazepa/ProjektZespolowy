package domain;

public class TextFile {
	private int id = 0;
	private int author = 0;
	private int group = 0;
	private String name = "";
	private String creationDate = "1970-01-01";
	private String description = "";
	private boolean isPrivate = true;
	
	public TextFile() {
		super();
	}

	public TextFile(int id, int author, int group, String name,
			String creationDate, String description, boolean isPrivate) {
		super();
		this.id = id;
		this.author = author;
		this.group = group;
		this.name = name;
		this.creationDate = creationDate;
		this.description = description;
		this.isPrivate = isPrivate;
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

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isPrivate() {
		return isPrivate;
	}

	public void setPrivate(boolean isPrivate) {
		this.isPrivate = isPrivate;
	}
}
