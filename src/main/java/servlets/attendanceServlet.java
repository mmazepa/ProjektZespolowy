package servlets;

import service.AttendanceManager;
import domain.Attendance;

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

@WebServlet(urlPatterns = "/attendances")
public class attendanceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	AttendanceManager db = new AttendanceManager();
    	List<Attendance> attendances = new ArrayList<Attendance>(); 
    	try {
    		attendances = db.getAllAttendances();
    	} catch (SQLException | NullPointerException e) {
    		e.printStackTrace();
    	}
      	request.setAttribute("attendances", attendances);
      	request.getRequestDispatcher("/subpages/attendances.jsp").forward(request, response);

    }

}
