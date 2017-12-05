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

@WebServlet("/doCreateAccount")
public class AccountCreator extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountManager db = new AccountManager();
		try {
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String firstname = request.getParameter("firstName");
			String lastname = request.getParameter("lastName");
			String dateofbirth = request.getParameter("dateOfBirth") + " 00:00:00";

      // if (dateofbirth == null || dateofbirth == "") {
      //   dateofbirth = "1970-01-01";
      // }
      // dateofbirth.concat(" 00:00:00");

			db.doTranBegin();
			db.addAccountByParams(3, nickname, email, pass, firstname, lastname, dateofbirth);
			db.doTranCommit();
			
			String ipAddress = request.getRemoteAddr();
	        //String hostname = request.getRemoteHost();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS CREATE   Account         "+ipAddress+"\t"+commitdate+"");
	        
	        response.sendRedirect("/subpages/registerSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();
			
			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    CREATE   Account         "+ipAddress+"\t"+commitdate+"");
	        e.printStackTrace();
	        
			response.sendRedirect("/subpages/registerFail.jsp");
		} finally {

			db.doTranEnd();
		}
	}
}
