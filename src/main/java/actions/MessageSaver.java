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

import service.MessageManager;
import domain.Message;

@WebServlet("/doSaveMessage")
public class MessageSaver extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String text = "File saved.";

	    MessageManager db = new MessageManager();

      // INFO FOR REDIRECT
	    int author = Integer.parseInt(request.getParameter("author"));
	    int group = Integer.parseInt(request.getParameter("group"));
	    int file = Integer.parseInt(request.getParameter("file"));

      // INFO FOR MESSAGE SAVER
	    int messageAuthor = Integer.parseInt(request.getParameter("messageAuthor"));
	    int messageGroup = Integer.parseInt(request.getParameter("messageGroup"));
	    String messageContent = request.getParameter("messageContent");

      // System.out.println("[MESS_TEST]: " + request.getParameter("messageAuthor"));
      // System.out.println("[MESS_TEST]: " + request.getParameter("messageGroup"));
      // System.out.println("[MESS_TEST]: " + request.getParameter("messageContent"));
      // try {
      //   for (Message mess : db.getAllMessages()) {
      //     System.out.println("[MESS]: " + mess.getAuthor());
      //     System.out.println("[MESS]: " + mess.getGroup());
      //     System.out.println("[MESS]: " + mess.getContent());
      //     System.out.println("-----------------------------");
      //   }
      // }
      // catch (SQLException e) {
      //   e.printStackTrace();
      // } catch (NullPointerException e) {
      //   e.printStackTrace();
      // }

	    try {
	    	db.addMessageByParams(messageAuthor, messageGroup, messageContent);
	    } catch (SQLException e) {
        e.printStackTrace();
	    	text = "Error when saving a file to message's database.";
	    } catch (NullPointerException e) {
        e.printStackTrace();
	    	text = "Error. No data provided";
	    }

	    response.sendRedirect("/subpages/editorForFileContent.jsp?author="+author+"&file="+file+"&group="+group+"");
	}
}
