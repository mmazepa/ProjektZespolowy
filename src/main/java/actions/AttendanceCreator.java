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

import domain.Account;
import service.AttendanceManager;
import service.AccountManager;

@WebServlet("/doInviteUser")
public class AttendanceCreator extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AttendanceManager db = new AttendanceManager();
		AccountManager am = new AccountManager();
		try {
			String name = request.getParameter("name");
			int group = Integer.parseInt(request.getParameter("id"));
			boolean admin = Boolean.parseBoolean(request.getParameter("admin"));

			db.doTranBegin();
			int account_id = 0;
		      List<Account> accounts = am.getAllAccounts();

		      for (Account account : accounts) {
		        if (account.getNickname().equals(name)) account_id = account.getID();
		      }
			db.addAttendanceByParams(group, account_id, admin);
			db.doTranCommit();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("SUCCESS CREATE   Attendance        "+ipAddress+"\t"+commitdate+"");

			response.sendRedirect("/subpages/createSuccess.jsp");
		} catch (SQLException e) {
			db.doTranRollback();

			String ipAddress = request.getRemoteAddr();
	        String commitdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
	        System.out.println("FAIL    CREATE   Attendance        "+ipAddress+"\t"+commitdate+"");
			e.printStackTrace();

			response.sendRedirect("/subpages/createFail.jsp");
		} finally {
			db.doTranEnd();
		}
	}
}
