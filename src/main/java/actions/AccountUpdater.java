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

import service.AccountManager;

@WebServlet("/doEditAccount")
public class AccountUpdater extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountManager db = new AccountManager();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int role = Integer.parseInt(request.getParameter("role"));
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String description = request.getParameter("description");
			String firstname = request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			String dateofbirth = request.getParameter("dateOfBirth");
			
			db.doTranBegin();
			db.editAccountByParams2(id, role, nickname, email, description, firstname, lastname, dateofbirth);
			db.doTranCommit();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS UPDATE   Account         "+ipAddress+"\t"+commitdate+"");
			
			response.sendRedirect("/subpages/updateSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    UPDATE   Account         "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();
	        
			response.sendRedirect("/subpages/updateFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
