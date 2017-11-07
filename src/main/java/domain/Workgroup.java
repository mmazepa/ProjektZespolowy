package domain;

public class Workgroup {
	private int id = 0;
	private String name = "";
	private String creationdate = "1970-01-01";
	private String description = "";
	private boolean is_private = true;
	
	public Workgroup() {
		
	}
	
	public Workgroup(int id, String name, String creationdate,
			String description, boolean is_private) {
		super();
		this.id = id;
		this.name = name;
		this.creationdate = creationdate;
		this.description = description;
		this.is_private = is_private;
	}

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreationDate() {
		return creationdate;
	}

	public void setCreationDate(String creationdate) {
		this.creationdate = creationdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isPrivate() {
		return is_private;
	}

	public void setPrivate(boolean is_private) {
		this.is_private = is_private;
	}
}
