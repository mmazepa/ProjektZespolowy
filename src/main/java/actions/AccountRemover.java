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

@WebServlet(urlPatterns = "/doRemoveAccount")
public class AccountRemover extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		AccountManager db = new AccountManager();
		try {
			db.doTranBegin();
			db.deleteAccount(id);
			db.doTranCommit();
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS DELETE   Account         "+ipAddress+"\t"+commitdate+"");
			response.sendRedirect("/subpages/removeSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    DELETE   Account         "+ipAddress+"\t"+commitdate+"");
	        e.printStackTrace();
	        
			response.sendRedirect("/subpages/removeFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
