package domain;

public class Attendance {
	private int id = 0;
	private int group = 0;
	private int user = 0;
	private boolean isAdmin = false;
	private String joinDate = "1970-01-01";
	
	public Attendance() {
		super();
	}

	public Attendance(int id, int group, int user, boolean isAdmin,
			String joinDate) {
		super();
		this.id = id;
		this.group = group;
		this.user = user;
		this.isAdmin = isAdmin;
		this.joinDate = joinDate;
	}

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
}