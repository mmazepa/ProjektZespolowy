package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.WorkgroupManager;

@WebServlet("/doEditWorkgroup")
public class WorkgroupUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WorkgroupManager db = new WorkgroupManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			boolean isPrivate = Boolean.parseBoolean(request.getParameter("private"));
			db.doTranBegin();
			db.editWorkgroupByParams(id, name, description,isPrivate);
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
