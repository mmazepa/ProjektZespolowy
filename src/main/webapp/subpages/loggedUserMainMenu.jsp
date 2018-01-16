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
        request.setAttribute("currentRole", currentRole);
    %>
    <main>
      <div class="centeredText">
        <h3>Logged User Main Menu</h3>

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${currentNickname != ''}">
          <%-- <h5 id="helloUser">
            <strong>HELLO!</strong>
            You are logged as <strong><%= currentNickname %></strong>
            ( <%= currentRole %> )
          </h5> --%>

          <div id="customPanel">
            <p id="customPanelInfo">
              Use buttons below to achieve prefered destination.
            </p>

            <!-- IF USER IS ADMINISTRATOR -->
            <c:if test="${currentRole == 'Administrator'}">
              <form action="/subpages/admin.jsp" method="post">
                <button id="userButton01" type="submit" class="btn btn-primary">
                  <span class="glyphicon glyphicon-wrench"></span>
                  Administrator Panel
                </button>
              </form>
            </c:if>

            <!-- IF USER IS MODERATOR -->
            <c:if test="${currentRole == 'Moderator'}">
              <form action="/subpages/admin.jsp" method="post">
                <button id="userButton01" type="submit" class="btn btn-primary">
                  <span class="glyphicon glyphicon-wrench"></span>
                  Moderator Panel
                </button>
              </form>
            </c:if>

            <!-- IF USER IS USER -->
            <c:if test="${currentRole == 'User'}"></c:if>

            <!-- CONTENT FOR EVERYONE -->
            <!--  <form action="/subpages/editor.jsp" method="post">
              <button id="userButton02" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-list-alt"></span>
                Editor
              </button>
            </form>-->
            <form action="/userFiles" method="post">
              <button id="userButton05" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-file"></span>
                My Files
              </button>
            </form>
            <form action="/subpages/userWorkgroups.jsp" method="post">
              <button id="userButton07" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-file"></span>
                My Workgroups
              </button>
            </form>
            <form action="/subpages/userProfile.jsp" method="post">
              <button id="userButton06" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-user"></span>
                My Profile
              </button>
            </form>
            <form action="/index.jsp" method="post">
              <button id="userButton04" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-th-list"></span>
                Home Page
              </button>
            </form>
            <form action="/doLogout" method="post">
              <button id="userButton03" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-log-out"></span>
                Log Out
              </button>
            </form>
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
      </div>
    </main>
    <footer></footer>
	</body>
</html>
