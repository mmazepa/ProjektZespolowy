package domain;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import service.RoleManager;

@Path("/sqltest")
public class SQLTester {
	@GET
	@Path("/")
	@Produces("text/html")
	public static Response getMsg(@PathParam("param") String msg) {
		String output = "<meta http-equiv='content-type' content='text/html;charset=utf-8' />";
		RoleManager db = new RoleManager();
		try {
			db.doTranBegin();
			
			output = output.concat("<h3>Dzień dobry!</h3><p>Serwis RESTowy działa...</p><b>Wpisano:</b> " + msg);
			output = output.concat("<br/><br/><a href='../../index.jsp'>powrót</a>");
			Role i = db.getRole(Integer.parseInt(msg));
			db.doTranCommit();
			output = output.concat("<table>");
			output = output.concat("<tr><td>"+i.getID()+"</td><td>"+i.getName()+"</td></tr>");
			output = output.concat("</table>");	
		} catch(SQLException e) {
			db.doTranRollback();
		} finally {
			db.doTranEnd();
		}
		//String output = "<meta http-equiv='content-type' content='text/html;charset=utf-8' />";
		//output = output.concat("<h3>Dzień dobry!</h3><p>Serwis RESTowy działa...</p><b>Wpisano:</b> " + msg);
		//output = output.concat("<br/><br/><a href='../../index.jsp'>powrót</a>");
		return Response.status(200).entity(output).build();
	}
}
