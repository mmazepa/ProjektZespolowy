package servlets;

import service.TextFileManager;
import domain.TextFile;

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

@WebServlet(urlPatterns = "/userFiles")
public class userFilesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	TextFileManager db = new TextFileManager();
    	List<TextFile> textFiles = new ArrayList<TextFile>();
    	try {
    		textFiles = db.getAllTextFiles();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}

    	request.setAttribute("textFiles", textFiles);
    	request.getRequestDispatcher("/subpages/userFiles.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	TextFileManager db = new TextFileManager();
    	List<TextFile> textFiles = new ArrayList<TextFile>();
    	try {
    		textFiles = db.getAllTextFiles();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}

    	request.setAttribute("textFiles", textFiles);
    	request.getRequestDispatcher("/subpages/userFiles.jsp").forward(request, response);
    }
}
