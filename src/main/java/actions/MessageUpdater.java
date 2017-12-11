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

import service.MessageManager;

@WebServlet("/doEditMessage")
public class MessageUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MessageManager db = new MessageManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			//int author = Integer.parseInt(request.getParameter("author"));
			//int group = Integer.parseInt(request.getParameter("group"));
			String content = request.getParameter("content");
			db.doTranBegin();
			db.editMessageByParams(id, content);
			db.doTranCommit();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS UPDATE   Message         "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Message         "+ipAddress+"\t"+commitdate+"");
			//e.printStackTrace();

			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
