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

import service.TextFileManager;
import service.WorkgroupManager;
import domain.Workgroup;

@WebServlet("/doCreateTextFile")
public class TextFileCreator extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TextFileManager db = new TextFileManager();
		try {
			String name = request.getParameter("name");
      int group = Integer.parseInt(request.getParameter("workgroup"));
			boolean isPrivate = Boolean.parseBoolean(request.getParameter("priv"));
      int author = Integer.parseInt(request.getParameter("author"));

			db.doTranBegin();

      WorkgroupManager wm = new WorkgroupManager();
      List<Workgroup> workgroups = wm.getAllWorkgroups();
      int workgroupID = 0;

      for (Workgroup workgroup : workgroups) {
        if (workgroup.getID() == group) workgroupID = workgroup.getID();
      }

			db.addTextFileByParams(author, workgroupID, name, isPrivate);
			db.doTranCommit();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS CREATE   TextFile        "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/createSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    CREATE   TextFile        "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();

			response.sendRedirect("/subpages/createFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
