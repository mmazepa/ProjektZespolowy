<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="domain.Account"%>
<%@ page import="service.WorkgroupManager"%>
<%@ page import="domain.Workgroup"%>
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
            List of text files
          </h3>
          <br/>
          <table class="adminTable textFileTable">
            <tr>
              <th>No.</th>
              <th>Author</th>
              <th>Group</th>
              <th>Name</th>
              <th>Creation Date</th>
  			      <th>Description</th>
  						<th>Private</th>
              <th>Edit Params</th>
              <th>Edit Content</th>
              <th>Delete</th>
            </tr>

            <%
              AccountManager am = new AccountManager();
              WorkgroupManager wm = new WorkgroupManager();

              List<Account> accounts = new ArrayList();
              List<Workgroup> workgroups = new ArrayList();

              accounts = am.getAllAccounts();
              workgroups = wm.getAllWorkgroups();

              request.setAttribute("accounts", accounts);
              request.setAttribute("workgroups", workgroups);
            %>

  					<c:set var="count" value="0" />
            <c:forEach var="textFile" items="${textFiles}">
          		<tr class="rowClass">
          			<td>
    							<c:set var="count" value="${count + 1}" />
    							<strong><c:out value="${count}" /></strong>
    						</td>
    					  <%-- <td><c:out value="${textFile.getAuthor()}"/></td> --%>
                <td>
                  <c:forEach var="account" items="${accounts}">
                    <c:if test="${account.getID() == textFile.getAuthor()}">
                      <c:out value="${account.getNickname()}"/>
                    </c:if>
                  </c:forEach>
                </td>

          			<%-- <td><c:out value="${textFile.getGroup()}"/></td> --%>
                <td>
                  <c:forEach var="workgroup" items="${workgroups}">
                    <c:if test="${workgroup.getID() == textFile.getGroup()}">
      					      <c:out value="${workgroup.getName()}"/>
                    </c:if>
                  </c:forEach>
                </td>

      					<td><c:out value="${textFile.getName()}"/></td>
      					<td><c:out value="${textFile.getCreationDate().substring(0,19)}"/></td>

      					<%-- <td><c:out value="${textFile.getDescription()}"/></td> --%>
                <td>
                  <c:choose>
                    <c:when test="${textFile.getDescription().length() > 50}">
                      <abbr title="${textFile.getDescription()}">
                        <c:out value="${textFile.getDescription().substring(0,50)}"/>
                        ...
                      </abbr>
                    </c:when>
                    <c:otherwise>
                      <c:out value="${textFile.getDescription()}"/>
                    </c:otherwise>
                  </c:choose>
                </td>


    						<%-- <td><c:out value="${textFile.isPrivate()}"/></td> --%>
                <td>
                  <c:choose>
                    <c:when test="${textFile.isPrivate()}">
                      <span class="glyphicon glyphicon-ok glyphiconGood"></span>
                    </c:when>
                    <c:otherwise>
                      <span class="glyphicon glyphicon-remove glyphiconBad"></span>
                    </c:otherwise>
                  </c:choose>
                </td>

                  <td>
                    <form action="/subpages/obtainEditedTextFileData.jsp" style="display:inline">
          						<input type="hidden" name="id" value="${textFile.getID()}">
          						<input type="hidden" name="name" value="${textFile.getName()}">
          						<input type="hidden" name="description" value="${textFile.getDescription()}">
    							<input type="hidden" name="private" value="${textFile.isPrivate()}">
          						<button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span>
          						</button>
                    </form>
                  </td>
                  <td>
                    <form action="/projekt/editor/${textFile.getAuthor()}/${textFile.getName()}" style="display:inline">
                    	<input type="hidden" name="filid" value="${textFile.getID()}">
                      <button type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-edit"></span>
                      </button>
                    </form>
                  </td>
      			  		<td>
                    <form action="/subpages/removeTextFile.jsp" style="display:inline" method="get">
    							<input type="hidden" name="id" value="${textFile.getID()}">
          						<input type="hidden" name="name" value="${textFile.getName()}">
          						<input type="hidden" name="description" value="${textFile.getDescription()}">
    							<input type="hidden" name="private" value="${textFile.isPrivate()}">
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
