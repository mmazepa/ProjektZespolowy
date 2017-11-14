package servlets;

import service.RoleManager;
import domain.Role;

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

@WebServlet(urlPatterns = "/roles")
public class roleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	RoleManager db = new RoleManager();
    	List<Role> roles = new ArrayList<Role>(); 
    	try {
    		roles = db.getAllRoles();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("roles", roles);
      	request.getRequestDispatcher("/subpages/roles.jsp").forward(request, response);

    }

}
