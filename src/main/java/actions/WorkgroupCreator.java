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


import service.WorkgroupManager;
import service.AttendanceManager;
import domain.Workgroup;

@WebServlet("/doCreateWorkgroup")
public class WorkgroupCreator extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WorkgroupManager db = new WorkgroupManager();
		AttendanceManager dba = new AttendanceManager();
		try {
			String name = request.getParameter("name");
		    int author = Integer.parseInt(request.getParameter("author"));
			boolean isPrivate = Boolean.parseBoolean(request.getParameter("priv"));
			
			db.doTranBegin();
      		db.addWorkgroupByParams(name, isPrivate);
			db.doTranCommit();
			
			dba.doTranBegin();
			int group_id = 0;
		      List<Workgroup> workgroups = db.getAllWorkgroups();

		      for (Workgroup workgroup : workgroups) {
		        if (workgroup.getName().equals(name)) group_id = workgroup.getID();
		      }
		      			
      		dba.addAttendanceByParams(group_id, author, true);
			dba.doTranCommit();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS CREATE   Workgroup        "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/createSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    CREATE   Workgroup        "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();

			response.sendRedirect("/subpages/createFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
