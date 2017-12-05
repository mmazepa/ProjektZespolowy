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

import service.SnapshotManager;

@WebServlet("/doEditSnapshot")
public class SnapshotUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SnapshotManager db = new SnapshotManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int author = Integer.parseInt(request.getParameter("author"));
			int group = Integer.parseInt(request.getParameter("group"));
			String name = request.getParameter("name");
			String content = request.getParameter("content");		
			db.doTranBegin();
			db.editSnapshotByParams(id, name, content);
			db.doTranCommit();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS UPDATE   Snapshot        "+ipAddress+"\t"+commitdate+"");
			
			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Snapshot        "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();
			
			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
