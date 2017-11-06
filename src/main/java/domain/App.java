package mypackage;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("/hello")
public class App {
  @GET
	@Path("/{param}")
	@Produces("text/html")
	public static Response getMsg(@PathParam("param") String msg) {
		String output = "<meta http-equiv='content-type' content='text/html;charset=utf-8' />";
		output = output.concat("<h3>Dzień dobry!</h3><p>Serwis RESTowy działa...</p><b>Wpisano:</b> " + msg);
		output = output.concat("<br/><br/><a href='../../index.jsp'>powrót</a>");
		return Response.status(200).entity(output).build();
	}
}
