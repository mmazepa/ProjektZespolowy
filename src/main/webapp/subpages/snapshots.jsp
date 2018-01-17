<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="domain.Account"%>
<%@ page import="service.TextFileManager"%>
<%@ page import="domain.TextFile"%>
<%@ page import="service.RoleManager"%>
<%@ page import="domain.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <jsp:useBean id="currentuser" class="domain.UserInfo" scope="session" />
	  <jsp:useBean id="storageTextFile" class="service.TextFileManager" scope="application" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <!-- SCRIPT FOR PAGINATION -->
    <script src="../static/javascript/pagination.js"></script>
	</head>
	<body onload="loadHeaderAndFooter(); loadRows();">
    <header></header>
    <%
        UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
        if (info != null) {
            currentuser = info;
        } else {
          //currentuser = new UserInfo();
        }

        String currentNickname = currentuser.getNickName();
        int currentRoleId = currentuser.getRole();
        String currentRole = new String();

        RoleManager db = new RoleManager();
        List<Role> roles = new ArrayList<Role>();
        try {
          roles = db.getAllRoles();
        } catch (SQLException | NullPointerException e) {
          e.printStackTrace();
        }

        for (Role role : roles) {
          if(role.getID() == currentRoleId) {
            currentRole = role.getName();
          }
        }

        request.setAttribute("currentNickname", currentNickname);
        request.setAttribute("currentRoleId", currentRoleId);
    %>
    <main>
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN AND IS ADMIN -->
        <c:if test="${(currentNickname != '') and ((currentRoleId == 1) or (currentRoleId == 2))}">
          <h3>
            <c:if test="${currentRoleId == 1}">
              Administrator Panel
            </c:if>
            <c:if test="${currentRoleId == 2}">
              Moderator Panel
            </c:if>
            <span class="glyphicon glyphicon-menu-right"></span>
            List of snapshots
          </h3>
          <br/>
          <table class="adminTable snapshotTable">
            <tr>
              <th>No.</th>
              <th>Author</th>
              <th>File</th>
              <th>Name</th>
              <th>Creation Date</th>
  			      <th>Content</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>

            <%
              AccountManager am = new AccountManager();
              TextFileManager txm = new TextFileManager();

              List<Account> accounts = new ArrayList();
              List<TextFile> textfiles = new ArrayList();

              accounts = am.getAllAccounts();
              textfiles = txm.getAllTextFiles();

              request.setAttribute("accounts", accounts);
              request.setAttribute("textfiles", textfiles);
            %>

  					<c:set var="count" value="0" />
            <c:forEach var="snapshot" items="${snapshots}">
          		<tr class="rowClass">
          			<td>
    							<%-- <c:out value="${snapshot.getID()}"/> --%>
    							<c:set var="count" value="${count + 1}" />
    							<strong><c:out value="${count}" /></strong>
    						</td>

    					  <%-- <td><c:out value="${snapshot.getAuthor()}"/></td> --%>
  							<td>
                  <c:forEach var="account" items="${accounts}">
                    <c:if test="${account.getID() == snapshot.getAuthor()}">
                      <c:out value="${account.getNickname()}"/>
                    </c:if>
                  </c:forEach>
                </td>

          			<%-- <td><c:out value="${snapshot.getFile()}"/></td> --%>
                <td>
                  <c:forEach var="textfile" items="${textfiles}">
                    <c:if test="${textfile.getID() == snapshot.getFile()}">
                      <c:out value="${textfile.getName()}"/>
                    </c:if>
                  </c:forEach>
                </td>

      					<td><c:out value="${snapshot.getName()}"/></td>
      					<td><c:out value="${snapshot.getCreationDate().substring(0,19)}"/></td>

      					<%-- <td><c:out value="${snapshot.getContent()}"/></td> --%>
								<td>
                  <code>
  									<c:choose>
  										<c:when test="${snapshot.getContent().length() > 50}">
  											<abbr title="${snapshot.getContent()}">
  												<c:out value="${snapshot.getContent().substring(0,50)}"/>
  												...
  											</abbr>
  										</c:when>
  										<c:otherwise>
  											<c:out value="${snapshot.getContent()}"/>
  										</c:otherwise>
  									</c:choose>
                  </code>
								</td>

                  <td>
                    <form action="/subpages/obtainEditedSnapshotData.jsp" style="display:inline">
          						<input type="hidden" name="id" value="${snapshot.getID()}">
          						<input type="hidden" name="author" value="${snapshot.getAuthor()}">
          						<input type="hidden" name="file" value="${snapshot.getFile()}">
          						<input type="hidden" name="name" value="${snapshot.getName()}">
          						<input type="hidden" name="creationDate" value="${snapshot.getCreationDate()}">
          						<input type="hidden" name="content" value="${snapshot.getContent()}">
          						<button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span>
          						</button>
                    </form>
                  </td>
      			  		<td>
                    <form action="/subpages/removeSnapshot.jsp" style="display:inline" method="get">
          						<input type="hidden" name="id" value="${snapshot.getID()}">
          						<input type="hidden" name="author" value="${snapshot.getAuthor()}">
          						<input type="hidden" name="file" value="${snapshot.getFile()}">
          						<input type="hidden" name="name" value="${snapshot.getName()}">
                      <button type="submit" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span>
          						</button>
    						    </form>
    					    </td>
      				</tr>
            </c:forEach>
          </table>
          <br/>

          <!-- PAGINATION MENU -->
          <!-- PREVIOUS PAGE BUTTON -->
					<button id="previousPage"
                  class="btn btn-success"
                  onclick="changePage('back')">
						<span class="glyphicon glyphicon-backward"></span>
					</button>
					Page
					<strong>
            <!-- CURRENT PAGE INFO -->
						<span id="currentPage">1</span>
					</strong>
					of
					<strong>
            <!-- ALL AVAILABLE PAGES INFO -->
						<span id="allPages">...</span>
					</strong>
          <!-- NEXT PAGE BUTTON -->
    			<button id="nextPage"
                  class="btn btn-success"
                  onclick="changePage('next')">
						<span class="glyphicon glyphicon-forward"></span>
					</button>

          <br/>
          <a id="backLink" href="/subpages/admin.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
        </c:if>

        <!-- IF USER IS LOGGED IN AND IS NOT ADMIN -->
        <c:if test="${(currentNickname != '') and ((currentRoleId != 1) and (currentRoleId != 2))}">
          <h5 id="helloGuest">
            <strong>SORRY!</strong>
            You don't have permission to see this section.
          </h5>
          <a id="backLink" href="/index.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
        </c:if>

        <!-- IF USER IS NOT LOGGED IN -->
        <c:if test="${currentNickname == ''}">
          <h5 id="helloGuest">
            <strong>HELLO!</strong>
            You are not logged in. Please log in to achieve permission do use editor.
          </h5>
          <a id="backLink" href="/index.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
        </c:if>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
