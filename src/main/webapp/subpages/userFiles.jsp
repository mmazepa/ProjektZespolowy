<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
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
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <%
//       AccountManager am = new AccountManager();
//       String currentNickname = am.activeAccountNickname;
//       int currentRole = am.activeAccountRole;
//       request.setAttribute("currentNickname", currentNickname);
//       request.setAttribute("currentRole", currentRole);
    UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
    if (info != null) {
        currentuser = info;
    } else {
      //currentuser = new UserInfo();
    }

        String currentNickname = currentuser.getNickName();
        int currentRoleId = currentuser.getUserID();
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
        request.setAttribute("currentRole", currentRole);
    %>
    <main id="indexMain">
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${currentNickname != ''}">
          <h3>Logged User Files</h3>
          <hr/>

          <!-- TABLE WITH FILES CREATED BY USER -->
          <h4>Files created by me</h4>
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
              <th>Edit</th>
              <th>Delete</th>
            </tr>
  					<c:set var="count" value="0" />
        		<tr>
        			<td>
  							<c:set var="count" value="${count + 1}" />
  							<c:out value="${count}" />
  						</td>
  					  <td>tmp_author</td>
        			<td>tmp_group</td>
    					<td>tmp_name</td>
    					<td>tmp_creationdate</td>
    					<td>tmp_description</td>
  						<td>tmp_private</td>
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
          </table>
          <br/>

          <!-- TABLE WITH FILES IN WHICH USER COOPERATES -->
          <h4>Files in which I cooperates</h4>
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
              <th>Delete</th>
            </tr>
  					<c:set var="count" value="0" />
        		<tr>
        			<td>
  							<c:set var="count" value="${count + 1}" />
  							<c:out value="${count}" />
  						</td>
  					  <td>tmp_author</td>
        			<td>tmp_group</td>
    					<td>tmp_name</td>
    					<td>tmp_create_date</td>
    					<td>tmp_description</td>
  						<td>tmp_private</td>

              <!-- zamiast removeTextFile to np. leaveGroup albo coś w ten deseń -->
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
          </table>
          <br/>
          <a href="/subpages/loggedUserMainMenu.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
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