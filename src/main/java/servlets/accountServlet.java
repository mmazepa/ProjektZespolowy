package servlets;

import service.AccountManager;
import domain.Account;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/accounts")
public class accountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      AccountManager db = new AccountManager();
    	List<Account> accounts = new ArrayList<Account>();
    	try {
    		accounts = db.getAllAccounts();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("accounts", accounts);
      	request.getRequestDispatcher("/subpages/accounts.jsp").forward(request, response);

    }
}
