package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Account;
import service.AccountManager;

@WebServlet("/doCheckCredentials")
public class CredentialsChecker extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AccountManager am = new AccountManager();
    List<Account> accounts = new ArrayList<Account>();
    Boolean credentialsCorrect = false;
    Account activeAccount = new Account();

    try {
      accounts = am.getAllAccounts();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    if (accounts != null) {
      String login = request.getParameter("login");
      String password = request.getParameter("password");

      for (Account account : accounts) {
        if (account.getNickname().equals(login) && account.getPass().equals(password)) {
          credentialsCorrect = true;
          activeAccount = account;
          break;
        }
      }

      if (credentialsCorrect) {
        request.setAttribute("userId", activeAccount.getID());
        request.setAttribute("userRole", activeAccount.getRole());
        request.setAttribute("userLogin", activeAccount.getNickname());

        am.activeAccountNickname = activeAccount.getNickname();

        response.sendRedirect("/subpages/LoginSuccess.jsp");
      }
      else {
        response.sendRedirect("/subpages/LoginFail.jsp");
      }
    }
    else {
      response.sendRedirect("/index.jsp");
    }
  }
}
