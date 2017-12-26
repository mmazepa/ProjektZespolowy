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
    <!-- SCRIPT FOR PAGINATION -->
    <script src="../static/javascript/pagination.js"></script>
	</head>
	<body onload="loadHeaderAndFooter(); loadRows();">
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
    <main id="indexMain">
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN AND IS ADMIN -->
        <c:if test="${(currentNickname != '') and (currentRoleId == 1)}">
          <h3>Administrator Panel</h3>
          <hr/>
          <h4>List of roles</h4>
          <br/>
          <table class="adminTable roleTable">
            <tr>
              <th>No.</th>
              <th>Name</th>
              <th>Edit</th>
              <!--<th>Delete</th>-->
            </tr>
            <c:set var="count" value="0" />
            <c:forEach var="role" items="${roles}">
          		<tr class="rowClass">
            		<td>
                  <%-- <c:out value="${role.getID()}"/> --%>
                  <c:set var="count" value="${count + 1}" />
                  <strong><c:out value="${count}" /></strong>
                </td>
      					<td><c:out value="${role.getName()}"/></td>
                  <td>
                    <form action="/subpages/obtainEditedRoleData.jsp" style="display:inline">
          						<input type="hidden" name="id" value="${role.getID()}">
          						<input type="hidden" name="name" value="${role.getName()}">
          						<button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span>
          						</button>
                    </form>
                  </td>
      			  		<!--<td>
                    <form action="/subpages/removeRole.jsp" style="display:inline" method="get">
          						<input type="hidden" name="id" value="${role.getID()}">
          						<input type="hidden" name="name" value="${role.getName()}">
                      <button type="submit" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span>
          						</button>
    						    </form>
    					    </td>-->
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
          <a href="/subpages/admin.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        </c:if>

        <!-- IF USER IS LOGGED IN AND IS NOT ADMIN -->
        <c:if test="${(currentNickname != '') and (currentRoleId != 1)}">
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
