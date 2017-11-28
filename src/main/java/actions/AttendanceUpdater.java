package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AttendanceManager;

@WebServlet("/doEditAttendance")
public class AttendanceUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AttendanceManager db = new AttendanceManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int grup = Integer.parseInt(request.getParameter("grup"));
			int user = Integer.parseInt(request.getParameter("user"));
			boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
			String joinDate = request.getParameter("joinDate");
			
			db.doTranBegin();
			db.editAttendanceByParams(id, grup, user, isAdmin);
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
