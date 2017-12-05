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
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS UPDATE   Role            "+ipAddress+"\t"+commitdate+"");
			
			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Role            "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();
			
			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
