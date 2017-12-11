package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Account;
import domain.UserInfo;
import service.AccountManager;

@WebServlet("/doLogout")
public class Logout extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//AccountManager am = new AccountManager();
    //am.activeAccountNickname = new String();
    //am.activeAccountRole = 0;
    
    HttpSession session = request.getSession();
    UserInfo info = new UserInfo();
    session.setAttribute("usersessioninfo", info);
    
    response.sendRedirect("/index.jsp");

  }
}
