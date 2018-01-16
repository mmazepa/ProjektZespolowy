package actions;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AccountManager;
import service.SnapshotManager;

@WebServlet("/ajx/doSaveFile")
public class TextFileSaver extends HttpServlet {

//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException
//    {
//        doPost(request, response);
//    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String text = "File saved.";

	    SnapshotManager db = new SnapshotManager();
	    int author = Integer.parseInt(request.getParameter("author"));
	    int group = Integer.parseInt(request.getParameter("group"));
	    int file = Integer.parseInt(request.getParameter("file"));
	    String name = request.getParameter("name");
	    String content = request.getParameter("content");

      // System.out.println("[SNAP_TEST]: " + author);
      // System.out.println("[SNAP_TEST]: " + group);
      // System.out.println("[SNAP_TEST]: " + file);
      // System.out.println("[SNAP_TEST]: " + name);
      // System.out.println("[SNAP_TEST]: " + content);


	    try {
	    	db.addSnapshotByParams(author, file, name, content);
	    } catch (SQLException e) {
	    	text = "Error when saving a file to workgroup's database.";
	    } catch (NullPointerException e) {
	    	text = "Error. No data provided";
	    }
//	    response.setContentType("text/plain");
//	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    //response.getWriter().write(text);
	    response.sendRedirect("/subpages/editorForFileContent.jsp?author="+author+"&file="+file+"&group="+group+"");
	}
}
