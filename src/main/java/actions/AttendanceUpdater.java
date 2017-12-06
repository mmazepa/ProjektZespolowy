package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
			int grup = Integer.parseInt(request.getParameter("group"));
			int user = Integer.parseInt(request.getParameter("user"));
			boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
			String joinDate = request.getParameter("joinDate");
			
			db.doTranBegin();
			db.editAttendanceByParams(id, grup, user, isAdmin);
			db.doTranCommit();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS UPDATE   Attendance      "+ipAddress+"\t"+commitdate+"");
			
			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Attendance      "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();
			
			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
