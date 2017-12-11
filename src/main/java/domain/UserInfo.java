package domain;

public class UserInfo {
	private int id = 0;
	private int userid = 0;
	private int role = 0;
	private String nickName = "";
	private String ip = "127.0.0.1";
	private boolean signedIn = false;
	
	public UserInfo () {
		
	}
	
	public UserInfo(int role, int userid, String nickName, String ip,
			boolean signedIn) {
		super();
		this.role = role;
		this.userid = userid;
		this.nickName = nickName;
		this.ip = ip;
		this.signedIn = signedIn;
	}
	
	public UserInfo(int id, int userid, int role, String nickName, String ip,
			boolean signedIn) {
		super();
		this.id = id;
		this.userid = userid;
		this.role = role;
		this.nickName = nickName;
		this.ip = ip;
		this.signedIn = signedIn;
	}

	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public int getUserID() {
		return userid;
	}

	public void setUserID(int userid) {
		this.userid = userid;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getIP() {
		return ip;
	}

	public void setIP(String ip) {
		this.ip = ip;
	}

	public boolean isSignedIn() {
		return signedIn;
	}

	public void setSignedIn(boolean signedIn) {
		this.signedIn = signedIn;
	}

}
