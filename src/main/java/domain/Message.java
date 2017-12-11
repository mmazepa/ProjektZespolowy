package domain;

public class Message {
	private int id = 0;
	private int author = 0;
	private int group = 0;
	private String creationDate = "1970-01-01";
	private String content = "";
	
	public Message() {
		super();
	}

	public Message(int id, int author, int group, String creationDate,
			String content) {
		super();
		this.id = id;
		this.author = author;
		this.group = group;
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

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
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
