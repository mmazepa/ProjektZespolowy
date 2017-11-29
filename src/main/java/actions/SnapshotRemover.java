package actions;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SnapshotManager;

@WebServlet(urlPatterns = "/doRemoveSnapshot")
public class SnapshotRemover extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		SnapshotManager db = new SnapshotManager();
		try {
			db.doTranBegin();
			db.deleteSnapshot(id);
			db.doTranCommit();
			response.sendRedirect("/subpages/removeSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			response.sendRedirect("/subpages/removeFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
