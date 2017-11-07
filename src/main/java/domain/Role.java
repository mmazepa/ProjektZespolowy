package domain;

public class Role {
	private int id = 0;
	private String Name = "";
	
	public Role() {
		super();
	}
	
	public Role(int a, String b) {
		this.setID(a);
		this.setName(b);
	}

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}	
}
