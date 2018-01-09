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
import java.sql.SQLException;
import java.net.URI;

import java.util.List;
import java.util.ArrayList;

import domain.Account;
import service.AccountManager;
import domain.TextFile;
import service.TextFileManager;

@Path("/editor")
public class editorServlet {
	@GET
	@Path("/{author}/{file}")
	@Produces("text/html")
	public static Response getMsg(@PathParam("author") String author, @PathParam("file") String file) throws IOException, FileNotFoundException {

    Boolean authorInBase = false;
    Boolean fileInBase = false;

    AccountManager am = new AccountManager();
    TextFileManager tfm = new TextFileManager();

    List<Account> accounts = new ArrayList<Account>();
    List<TextFile> textfiles = new ArrayList<TextFile>();

    String url = new String();
    String authorName = new String();

    try {
      accounts = am.getAllAccounts();
      textfiles = tfm.getAllTextFiles();
    }
    catch (SQLException e) {
      e.printStackTrace();
    }

    int authorID = 0;
    for (Account account : accounts) {
      if (account.getID() == Integer.parseInt(author)) {
        authorInBase = true;
        //authorName = account.getName();
        authorID = account.getID();
      }
    }

    TextFile fifi = new TextFile();
    for (TextFile textfile : textfiles) {
      if (textfile.getName().equals(file)) {
        fileInBase = true;
        fifi = textfile; 
      }
    }

    if (authorInBase && fileInBase) {
      url = "../subpages/editorForFileContent.jsp?author=" + String.valueOf(authorID) + "&file=" + String.valueOf(fifi.getID()) + "&group=" + String.valueOf(fifi.getGroup());
    }
    else {
      url = "../subpages/fileNotFound.jsp";
    }

    return Response.temporaryRedirect(URI.create(url)).build();

	}
}
