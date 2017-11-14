package servlets;

import service.AccountManager;
import domain.Account;

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

@WebServlet(urlPatterns = "/accounts")
public class accountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      	AccountManager db = new AccountManager();
    	List<Account> accounts = new ArrayList<Account>(); 
    	try {
    		accounts = db.getAllAccounts();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("accounts", accounts);
      	request.getRequestDispatcher("/subpages/accounts.jsp").forward(request, response);

    }

/*
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String userRole = (String) request.getSession().getAttribute("role");
    	if (UserDAO.authorize(userRole, "Admin", "Edytor", "User")) {
	        User u = new User();
	        String oldPass = request.getParameter("oldPass");
	        u.setId_User(Integer.parseInt(request.getParameter("id_User")));
	        u.setId_Role(Integer.parseInt(request.getParameter("id_Role")));
	        u.setEmail(request.getParameter("email"));
	        u.setPassw(request.getParameter("passw"));
	        u.setFirst_name(request.getParameter("first_name"));
	        u.setLast_name(request.getParameter("last_name"));
	        u.setSt_index(Integer.parseInt(request.getParameter("st_index")));

	        if(UserDAO.UpdateUser(u,oldPass)==1){
	            if (UserDAO.authorize(userRole, "Admin"))
	                response.sendRedirect("accManager");
	            else
	                response.sendRedirect("userPanel.jsp");
	        }
       	}
       	else {
        	response.sendRedirect("accessDeniedPage.jsp");
        }
    }
    */
}
