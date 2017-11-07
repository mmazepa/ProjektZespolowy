package domain;

public class Account {
	private int id = 0;
	private int role = 0;
	private String nickname = "";
	private String email = "";
	private String pass = "";
	private String registrationdate = "1970-01-01";
	private String description = "";
	private String firstname = "";
	private String lastname = "";
	private String dateofbirth = "1970-01-01";
	
	public Account() {
		super();
	}
	
	public Account(int id, int role, String nickname, String email,
			String pass, String registrationdate, String description,
			String firstname, String lastname, String dateofbirth) {
		super();
		this.id = id;
		this.role = role;
		this.nickname = nickname;
		this.email = email;
		this.pass = pass;
		this.registrationdate = registrationdate;
		this.description = description;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dateofbirth = dateofbirth;
	}
	
	public int getID() {
		return id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getRegistrationdate() {
		return registrationdate;
	}

	public void setRegistrationdate(String registrationdate) {
		this.registrationdate = registrationdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFirstName() {
		return firstname;
	}

	public void setFirstName(String firstname) {
		this.firstname = firstname;
	}

	public String getLastName() {
		return lastname;
	}

	public void setLastName(String lastname) {
		this.lastname = lastname;
	}

	public String getDateOfBirth() {
		return dateofbirth;
	}

	public void setDateOfBirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	
}
