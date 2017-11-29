package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RoleManager;

@WebServlet(urlPatterns = "/doRemoveRole")
public class RoleRemover extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		RoleManager db = new RoleManager();
		try {
			db.doTranBegin();
			db.deleteRole(id);
			db.doTranCommit();
			response.sendRedirect("/subpages/removeSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			response.sendRedirect("/subpages/removeFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
