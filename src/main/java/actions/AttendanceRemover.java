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

@WebServlet(urlPatterns = "/doRemoveAttendance")
public class AttendanceRemover extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		AttendanceManager db = new AttendanceManager();
		try {
			db.doTranBegin();
			db.deleteAttendance(id);
			db.doTranCommit();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS DELETE   Attendance      "+ipAddress+"\t"+commitdate+"");
			
			response.sendRedirect("/subpages/removeSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    DELETE   Attendance      "+ipAddress+"\t"+commitdate+"");
	        e.printStackTrace();
			
			response.sendRedirect("/subpages/removeFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
