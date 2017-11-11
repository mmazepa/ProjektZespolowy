
package service;
import java.sql.SQLException;
import java.util.List;

import domain.Account;
interface IAccountManager {

    public void addAccount(Account account) throws SQLException, NumberFormatException;
    public void editAccount(int oldAccountId, Account newAccountData) throws SQLException, NumberFormatException;
    public void deleteAccount(int accountId) throws SQLException;
    public Account getAccount(int accountId) throws SQLException, NullPointerException;
    public List<Account> getAllAccounts() throws SQLException, NullPointerException;

}