package servlets;

import service.SnapshotManager;
import domain.Snapshot;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/snapshots")
public class snapshotServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	SnapshotManager db = new SnapshotManager();
    	List<Snapshot> snapshots = new ArrayList<Snapshot>(); 
    	try {
    		snapshots = db.getAllSnapshots();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("snapshots", snapshots);
      	request.getRequestDispatcher("/subpages/snapshots.jsp").forward(request, response);

    }

}
