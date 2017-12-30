package servlets;

import service.AccountManager;
import domain.Account;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;

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

      // SORTOWANIE WEDŁUG DATY REJESTRACJI
      accounts.sort((acc1, acc2) -> {
        String stringDate1 = acc1.getRegistrationdate();
        String stringDate2 = acc2.getRegistrationdate();

        DateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss.SSSSSS");

        Date accRegDate1 = new Date();
        Date accRegDate2 = new Date();

        try {
          accRegDate1 = format.parse(stringDate1);
          accRegDate2 = format.parse(stringDate2);
        }
        catch (ParseException e) {
          e.printStackTrace();
        }

        if (accRegDate1 == accRegDate2) {
          return 0;
        }
        else if (accRegDate1.after(accRegDate2)) {
          return 1;
        }
        else if (accRegDate1.before(accRegDate2)) {
          return -1;
        }
        return 0;
      });

      // SORTOWANIE WEDŁUG ROLI
      accounts.sort((acc1, acc2) -> {
        if (acc1.getRole() == acc2.getRole()) {
          return 0;
        }
        else if (acc1.getRole() > acc2.getRole()) {
          return 1;
        }
        else if (acc1.getRole() < acc2.getRole()) {
          return -1;
        }
        return 0;
      });

      request.setAttribute("accounts", accounts);
      request.getRequestDispatcher("/subpages/accounts.jsp").forward(request, response);

    }
}
