package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Attendance;
import service.AttendanceManager;

@WebServlet("/doRemoveAttendanceByUser")
public class AttendanceRemoverByUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int group = Integer.parseInt(request.getParameter("group"));
		AttendanceManager db = new AttendanceManager();
		try {
			
			int att_id = 0;
		      List<Attendance> attendances = db.getAllAttendances();

		      for (Attendance attendance : attendances) {
		        if (attendance.getUser() == id){
		        	if (attendance.getGroup() == group){
		        		att_id = attendance.getID();
		        	}
		        }
		      }
			db.doTranBegin();
			db.deleteAttendance(att_id);
			db.doTranCommit();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS DELETE   Attendance        "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/userActions/removeSuccessByUser.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    DELETE   Attendance        "+ipAddress+"\t"+commitdate+"");
	        e.printStackTrace();

			response.sendRedirect("/subpages/userActions/removeFailByUser.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
