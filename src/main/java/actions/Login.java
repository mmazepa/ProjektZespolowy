package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Account;
import domain.UserInfo;
import service.AccountManager;

@WebServlet("/doLogin")
public class Login extends HttpServlet {
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
        if (account.getNickname().equals(login) && account.getPass().equals(Long.toHexString(am.haszuj(password)))) {
          credentialsCorrect = true;
          activeAccount = account;
          break;
        }
      }

      if (credentialsCorrect) {
        // request.setAttribute("userId", activeAccount.getID());
        // request.setAttribute("userRole", activeAccount.getRole());
        // request.setAttribute("userLogin", activeAccount.getNickname());
    	  
    	  HttpSession session = request.getSession();
    	  UserInfo info = new UserInfo(activeAccount.getID(), activeAccount.getRole(), activeAccount.getNickname(), request.getRemoteAddr(), true);
    	  session.setAttribute("usersessioninfo", info);

        //am.activeAccountNickname = activeAccount.getNickname();
        //am.activeAccountRole = activeAccount.getRole();

        String ipAddress = request.getRemoteAddr();
        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
        System.out.println("SUCCESS CHECK    Account         "+ipAddress+"\t"+commitdate+"");

        response.sendRedirect("/subpages/loggedUserMainMenu.jsp");
      }
      else {
      	String ipAddress = request.getRemoteAddr();
  	    String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
  	    System.out.println("FAIL    CHECK    Account         "+ipAddress+"\t"+commitdate+"");

        response.sendRedirect("/subpages/LoginFail.jsp");
      }
    }
    else {
      response.sendRedirect("/index.jsp");
    }
  }
}
