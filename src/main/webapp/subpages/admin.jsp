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
        request.setAttribute("currentRoleId", currentRoleId);
    %>
    <main>
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN AND IS ADMIN -->
        <c:if test="${(currentNickname != '') and ((currentRoleId == 1) or (currentRoleId == 2))}">
          <h3>
            <span class="glyphicon glyphicon-sunglasses"></span>
            <c:if test="${currentRoleId == 1}">
              Administrator Panel
            </c:if>
            <c:if test="${currentRoleId == 2}">
              Moderator Panel
            </c:if>
            <span class="glyphicon glyphicon-sunglasses"></span>
          </h3>
          <div id="customPanel">
            <p id="customPanelInfo">
              Welcome to
              <c:if test="${currentRoleId == 1}">
                <strong>Administrator Panel</strong>.
              </c:if>
              <c:if test="${currentRoleId == 2}">
                <strong>Moderator Panel</strong>.
              </c:if>
              <br/>
              Choose what you want to manage by clicking one of buttons below.
            </p>

            <!-- ADMIN BUTTONS SECTION -->
            <div class="adminButtonsGroup">
              <c:if test="${currentRoleId == 1}">
                <div class="wrapper">
                  <button id="accounts"
                          class="adminButtons"
                          onclick="location.assign('/accounts')">
                      Accounts
                  </button>
                  <p class="text">List of users</p>
                </div>
              </c:if>
              <div class="wrapper">
                <button id="attendances"
                        class="adminButtons"
                        onclick="location.assign('/attendances')">
                    Attendances
                </button>
                <p class="text">List of attendances</p>
              </div>
              <c:if test="${currentRoleId == 1}">
                <div class="wrapper">
                  <button id="roles"
                          class="adminButtons"
                          onclick="location.assign('/roles')">
                      Roles
                  </button>
                  <p class="text">List of roles</p>
                </div>
              </c:if>
              <c:if test="${currentRoleId == 1}">
                <br/>
              </c:if>
              <div class="wrapper">
                <button id="snapshots"
                        class="adminButtons"
                        onclick="location.assign('/snapshots')">
                    Snapshots
                </button>
                <p class="text">List of snapshots</p>
              </div>
              <c:if test="${currentRoleId == 2}">
                <br/>
              </c:if>
              <div class="wrapper">
                <button id="textFiles"
                        class="adminButtons"
                        onclick="location.assign('/textFiles')">
                    Text Files
                </button>
                <p class="text">List of text files</p>
              </div>
              <div class="wrapper">
                <button id="workgroups"
                        class="adminButtons"
                        onclick="location.assign('/workgroups')">
                    Workgroups
                </button>
                <p class="text">List of workgroups</p>
              </div>
            </div>
            <br/>

            <p id="customPanelInfo">
              <c:if test="${currentRoleId == 1}">
                Administrator panel
              </c:if>
              <c:if test="${currentRoleId == 2}">
                Moderator panel
              </c:if>
              for
              <c:if test="${currentRoleId == 1}">
                administrative things.
              </c:if>
              <c:if test="${currentRoleId == 2}">
                moderative things.
              </c:if>
            </p>
          </div>

          <a id="backLink" href="/subpages/loggedUserMainMenu.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
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
