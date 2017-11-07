
package service;
import domain.Account;
interface IAccountManager {

    public void addAccount(Account account);
    public void editAccount(int oldAccountId, Account newAccountData);
    public void deleteAccount(int accountId);
    public void getAccount(int accountId);
    public void getAllAccounts();

}
