package service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import domain.Account;


public class AccountManager extends SQLHandler implements IAccountManager {

	private String getAllAccountStmt = "SELECT "
			+ "id, AccountRole, NickName, Email, UserPass, RegistrationDate, "
			+ "Description, FirstName, LastName, DateOfBirth "
			+ "FROM Account;";

	private PreparedStatement getAccountByIDStmt;
	private PreparedStatement deleteAccountStmt;
	private PreparedStatement addAccountStmt;
	private PreparedStatement addAccountByParamsStmt;
	private PreparedStatement editAccountStmt;
	private PreparedStatement editAccountByParamsStmt;

	public AccountManager() {
		super();
		try {
			getAccountByIDStmt = getConnection().prepareStatement("SELECT "
					+ "id, AccountRole, NickName, Email, UserPass, RegistrationDate, "
					+ "Description, FirstName, LastName, DateOfBirth "
					+ "FROM Account WHERE "
					+ "id = ?");
			deleteAccountStmt = getConnection().prepareStatement("DELETE FROM Account WHERE id = ?;");
			addAccountByParamsStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Account (AccountRole, NickName, Email, UserPass, "
					+ "FirstName, LastName, DateOfBirth) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?);");
			addAccountStmt = getConnection().prepareStatement("INSERT INTO "
					+ "Account (AccountRole, NickName, Email, UserPass, RegistrationDate, "
					+ "Description, FirstName, LastName, DateOfBirth) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
			editAccountStmt = getConnection().prepareStatement("UPDATE Account SET "
					+ "AccountRole = ?, NickName = ?, Email = ?, "
					+ "UserPass = ?, RegistrationDate = ?, Description = ?, "
					+ "FirstName = ?, LastName = ?, DateOfBirth = ? "
					+ "WHERE id = ?;");
			editAccountByParamsStmt = getConnection().prepareStatement("UPDATE Account SET "
					+ "NickName = ?, Email = ?, "
					+ "UserPass = ?, Description = ?, "
					+ "FirstName = ?, LastName = ?, DateOfBirth = ? "
					+ "WHERE id = ?;");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

  @Override
  public void addAccount(Account account) throws SQLException, NumberFormatException {
	  addAccountStmt.setInt(1, account.getRole());
	  addAccountStmt.setString(2, account.getNickname());
	  addAccountStmt.setString(3, account.getEmail());
	  addAccountStmt.setString(4, account.getPass());
	  addAccountStmt.setString(5, account.getRegistrationdate());
	  addAccountStmt.setString(6, account.getDescription());
	  addAccountStmt.setString(7, account.getFirstName());
	  addAccountStmt.setString(8, account.getLastName());
	  addAccountStmt.setString(9, account.getDateOfBirth());

	  addAccountStmt.executeUpdate();
  }
  
  @Override
  public void addAccountByParams(int role, String nickname, String email,
								String pass, String firstname, 
								String lastname, String dateofbirth) 
								throws SQLException, NumberFormatException {
	  addAccountByParamsStmt.setInt(1, role);
	  addAccountByParamsStmt.setString(2, nickname);
	  addAccountByParamsStmt.setString(3, email);
	  addAccountByParamsStmt.setString(4, pass);
	  addAccountByParamsStmt.setString(5, firstname);
	  addAccountByParamsStmt.setString(6, lastname);
	  addAccountByParamsStmt.setString(7, dateofbirth);

	  addAccountByParamsStmt.executeUpdate();
  }

  @Override
  public void editAccount(int oldAccountId, Account newAccountData) throws SQLException, NumberFormatException {
	  editAccountStmt.setInt(1, newAccountData.getRole());
	  editAccountStmt.setString(2, newAccountData.getNickname());
	  editAccountStmt.setString(3, newAccountData.getEmail());
	  editAccountStmt.setString(4, newAccountData.getPass());
	  editAccountStmt.setString(5, newAccountData.getRegistrationdate());
	  editAccountStmt.setString(6, newAccountData.getDescription());
	  editAccountStmt.setString(7, newAccountData.getFirstName());
	  editAccountStmt.setString(8, newAccountData.getLastName());
	  editAccountStmt.setString(9, newAccountData.getDateOfBirth());

	  editAccountStmt.setInt(10, oldAccountId);

	  editAccountStmt.executeUpdate();
  }
  
  @Override
  public void editAccountByParams(int id, String nickname, String email,
			String pass, String description, String firstname, String lastname, String dateofbirth) throws SQLException, NumberFormatException {
	  editAccountByParamsStmt.setString(1, nickname);
	  editAccountByParamsStmt.setString(2, email);
	  editAccountByParamsStmt.setString(3, pass);
	  editAccountByParamsStmt.setString(4, description);
	  editAccountByParamsStmt.setString(5, firstname);
	  editAccountByParamsStmt.setString(6, lastname);
	  editAccountByParamsStmt.setString(7, dateofbirth);

	  editAccountByParamsStmt.setInt(8, id);

	  editAccountByParamsStmt.executeUpdate();
  }

  @Override
  public void deleteAccount(int accountId) throws SQLException {
	  deleteAccountStmt.setInt(1, accountId);
	  deleteAccountStmt.executeUpdate();
  }

  @Override
  public Account getAccount(int accountId) throws SQLException, NullPointerException {
	  Account p = new Account();

	  getAccountByIDStmt.setInt(1, accountId);
	  ResultSet rs = getAccountByIDStmt.executeQuery();

	  rs.next();
	  p.setID(rs.getInt("id"));
	  p.setRole(rs.getInt("AccountRole"));
	  p.setNickname(rs.getString("NickName"));
	  p.setEmail(rs.getString("Email"));
	  p.setPass(rs.getString("UserPass"));
	  p.setRegistrationdate(rs.getString("RegistrationDate"));
	  p.setDescription(rs.getString("Description"));
	  p.setFirstName(rs.getString("FirstName"));
	  p.setLastName(rs.getString("LastName"));
	  p.setDateOfBirth(rs.getString("DateOfBirth"));

	  return p;
  }

  @Override
  public List<Account> getAllAccounts() throws SQLException, NullPointerException {
	  List<Account> lista = Collections.synchronizedList(new ArrayList<Account>());

	  ResultSet rs = statement.executeQuery(getAllAccountStmt);
	  while (rs.next()) {
		  Account p = new Account();
		  p.setID(rs.getInt("id"));
		  p.setRole(rs.getInt("AccountRole"));
		  p.setNickname(rs.getString("NickName"));
		  p.setEmail(rs.getString("Email"));
		  p.setPass(rs.getString("UserPass"));
		  p.setRegistrationdate(rs.getString("RegistrationDate"));
		  p.setDescription(rs.getString("Description"));
		  p.setFirstName(rs.getString("FirstName"));
		  p.setLastName(rs.getString("LastName"));
		  p.setDateOfBirth(rs.getString("DateOfBirth"));
		  lista.add(p);
	  }
	  return lista;
  }

  public static ArrayList<Account> getAllAccounts2(){
		Account account1 = new Account(1, 1, "user1", "user1@user.com", "user1pass", "1970-01-01", "user1description", "User", "One", "1970-01-01");
    Account account2 = new Account(2, 1, "user2", "user2@user.com", "user2pass", "1970-01-01", "user2description", "User", "Two", "1970-01-01");
    Account account3 = new Account(3, 1, "user3", "user3@user.com", "user3pass", "1970-01-01", "user3description", "User", "Three", "1970-01-01");
    Account account4 = new Account(4, 1, "user4", "user4@user.com", "user4pass", "1970-01-01", "user4description", "User", "Four", "1970-01-01");
    Account account5 = new Account(5, 1, "user5", "user5@user.com", "user5pass", "1970-01-01", "user5description", "User", "Five", "1970-01-01");

		ArrayList<Account> accounts = new ArrayList<>();
		accounts.add(account1);
		accounts.add(account2);
		accounts.add(account3);
		accounts.add(account4);
		accounts.add(account5);

		return accounts;
	}

}
