package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountManager;

@WebServlet("/doEditAccount")
public class AccountUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountManager db = new AccountManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int role = Integer.parseInt(request.getParameter("role"));
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String description = request.getParameter("description");
			String firstname = request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			String dateofbirth = request.getParameter("dateOfBirth");
			
			db.doTranBegin();
			db.editAccountByParams(id, role, nickname, email, pass, description, firstname, lastname, dateofbirth);
			db.doTranCommit();
			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			e.printStackTrace();
			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
