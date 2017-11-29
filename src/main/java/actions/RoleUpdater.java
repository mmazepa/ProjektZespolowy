package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RoleManager;

@WebServlet("/doEditRole")
public class RoleUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RoleManager db = new RoleManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");		
			db.doTranBegin();
			db.editRoleByParams(id, name);
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
