package mypackage;

public class User {

	private long id;
	private String login;
  private String firstname;
  private String lastname;
  private String password;

	public User() {}

	public User(String login, String firstname, String lastname, String password) {
		super();
		this.login = login;
    this.firstname = firstname;
    this.lastname = lastname;
    this.password = password;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

  public String getFirstname() {
    return firstname;
  }

  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }

  public String getLastname() {
    return lastname;
  }

  public void setLastname(String lastname) {
    this.lastname = lastname;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
