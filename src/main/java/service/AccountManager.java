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

}
