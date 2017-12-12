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

        <!-- IF USER IS LOGGED ID -->
        <c:if test="${currentNickname != ''}">
          <h3>Logged User Profile</h3>
          <hr/>
          <table class="adminTable accountTable">
            <tr>
              <th>Property</th>
              <th>Value</th>
            </tr>
            <tr>
              <td>Role</td>
              <td>tmp_role</td>
            </tr>
            <tr>
              <td>Nickname</td>
              <td>tmp_nickname</td>
            </tr>
            <tr>
              <td>E-mail</td>
              <td>tmp_email</td>
            </tr>
            <tr>
              <td>Password</td>
              <td>tmp_password</td>
            </tr>
            <tr>
              <td>Registration Date</td>
              <td>tmp_registrationdate</td>
            </tr>
            <tr>
              <td>Description</td>
              <td>tmp_description</td>
            </tr>
            <tr>
              <td>First Name</td>
              <td>tmp_firstname</td>
            </tr>
            <tr>
              <td>Last Name</td>
              <td>tmp_lastname</td>
            </tr>
            <tr>
              <td>Date Of Birth</td>
              <td>tmp_dateofbirth</td>
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