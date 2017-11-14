package servlets;

import service.WorkgroupManager;
import domain.Workgroup;

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

@WebServlet(urlPatterns = "/workgroup")
public class workgroupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	WorkgroupManager db = new WorkgroupManager();
    	List<Workgroup> workgroups = new ArrayList<Workgroup>(); 
    	try {
    		workgroups = db.getAllWorkgroups();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("workgroups", workgroups);
      	request.getRequestDispatcher("/subpages/workgroups.jsp").forward(request, response);

    }

}
