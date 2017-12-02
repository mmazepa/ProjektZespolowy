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

@WebServlet(urlPatterns = "/editor")
public class editorServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

        String activeAccountNickname = AccountManager.activeAccountNickname;
      	request.setAttribute("activeAccountNickname", activeAccountNickname);
      	response.sendRedirect("/subpages/editor.jsp");

    }
}
