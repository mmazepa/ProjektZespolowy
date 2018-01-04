package mypackage;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileNotFoundException;

@Path("/editor")
public class editorServlet {
  @GET
	@Path("/{author}/{file}")
	@Produces("text/html")
	public static Response getMsg(@PathParam("author") String author, @PathParam("file") String file) throws IOException, FileNotFoundException {

    //System.out.println("[Working Directory]: " + System.getProperty("user.dir"));

    BufferedReader br = new BufferedReader(new FileReader("src/main/webapp/subpages/editor.jsp"));
    String everything = new String();
    try {
        StringBuilder sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
            sb.append(line);
            sb.append(System.lineSeparator());
            line = br.readLine();
        }
        everything = sb.toString();
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
        br.close();
    }

		return Response.status(200).entity("<h1>Editing file <b>" + file + "</b></h1>" + everything).build();

	}
}
