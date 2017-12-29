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
		<link type="text/css" rel="stylesheet" href="static/css/main.css" />
		<jsp:useBean id="currentuser" class="domain.UserInfo" scope="session" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="static/javascript/main.js"></script>
    <!-- ANGULAR JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
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
        <h3>Welcome to Editor On-Line</h3>
        <hr/>

        <!-- IF USER IS NOT LOGGED IN -->
        <c:if test="${currentNickname == ''}">
          <p>
            We're glad to see you visiting our site! We'll be pleased, if you mind check functionality<br/>
            prepared for you. Log in, if you have an account, or register, if you want to have one.
          </p>

          <!-- LOGGING IN SECTION // ANGULAR JS INCLUDED -->
          <div ng-app="" class="authorization">
            <form name="form" action="/doLogin" method="POST">
              Login<br/>
              <input  id="login"
                      class="credentials"
                      type="text"
                      name="login"
                      maxlength="20"
                      pattern="[a-zA-Z0-9_.-]{3,20}"
                      title="All letters allowed, min 3, max 20."
                      ng-model="login"
                      ng-pattern="[a-zA-Z0-9_.-]{3,20}"
                      required/>
              <br/>
              Password<br/>
              <input  id="password"
                      class="credentials"
                      type="password"
                      name="password"
                      ng-model="password"
                      required/>
              <br/>
              Credentials validation:
              <span ng-if="form.$valid">
                <span class="glyphicon glyphicon-ok glyphiconGood"></span>
              </span>
              <span ng-if="form.$invalid">
                <span class="glyphicon glyphicon-remove glyphiconBad"></span>
              </span>
              <br/>
              <!-- LOG IN BUTTON -->
              <button  id="loginButton"
                      type="submit"
                      class="btn btn-success"
                      value="Log In">
                  <span class="glyphicon glyphicon-log-in"></span>
                  Log In
              </button>
            </form>
            <br/>
          </div>

          <p>
            Don't have an account? Want one? Just use our
            <a href="subpages/register.jsp">register</a> form.
          </p>
        </c:if>

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${currentNickname != ''}">
          <h5 id="helloUser">
            <strong>HELLO!</strong>
            You are logged as <strong><%= currentNickname %></strong>
            ( <%= currentRole %> )
          </h5>
          <p>
            You are logged in, so do what you want to.
          </p>
          <form action="/subpages/loggedUserMainMenu.jsp" method="post">
            <button id="userButton04" type="submit" class="btn btn-primary">
              <span class="glyphicon glyphicon-th-list"></span>
              Logged User Main Menu
            </button>
          </form>
          <form action="/doLogout" method="post">
            <button id="userButton03" type="submit" class="btn btn-primary">
              <span class="glyphicon glyphicon-log-out"></span>
              Log Out
            </button>
          </form>
        </c:if>

        <!-- LICENSE ADNOTATION -->
        <p>
          Some parts of this site is working under
          <a href="/subpages/license.jsp">some license</a>.
        </p>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
