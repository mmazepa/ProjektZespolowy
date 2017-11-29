package actions;

import java.io.IOException;
import java.sql.SQLException;

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
