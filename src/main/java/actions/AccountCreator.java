package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountManager;

@WebServlet("/doCreateAccount")
public class AccountCreator extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountManager db = new AccountManager();
		try {
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String firstname = request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			String dateofbirth = request.getParameter("dateOfBirth") + " 00:00:00";

      // if (dateofbirth == null || dateofbirth == "") {
      //   dateofbirth = "1970-01-01";
      // }
      // dateofbirth.concat(" 00:00:00");

			db.doTranBegin();
			db.addAccountByParams(3, nickname, email, pass, firstname, lastname, dateofbirth);
			db.doTranCommit();
      response.sendRedirect("/subpages/registerSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			e.printStackTrace();
      response.sendRedirect("/subpages/registerFail.jsp");
		} finally {

			db.doTranEnd();
		}
	}
}
