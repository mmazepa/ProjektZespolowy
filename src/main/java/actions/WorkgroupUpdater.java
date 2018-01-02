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
			db.editWorkgroupByParams(id, name, description, isPrivate);
			db.doTranCommit();

			String ipAddress = request.getRemoteAddr();
      String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
      System.out.println("SUCCESS UPDATE   Workgroup       "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Workgroup       "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();

			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
