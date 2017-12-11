<%@page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
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
      	int currentRole = currentuser.getRole();
      	request.setAttribute("currentNickname", currentNickname);
      	request.setAttribute("currentRole", currentRole);
    %>
    <main id="indexMain">
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
                      pattern="[A-Za-z]{3,20}"
                      title="All letters allowed, min 3, max 20."
                      ng-model="login"
                      ng-pattern="[A-Za-z]{3,20}"
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
                <span class="glyphicon glyphicon-ok" style="color:green;"></span>
              </span>
              <span ng-if="form.$invalid">
                <span class="glyphicon glyphicon-remove" style="color:red;"></span>
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
            (
            <c:choose>
              <c:when test="${currentRole == 1}">Administrator</c:when>
              <c:when test="${currentRole == 2}">Moderator</c:when>
              <c:when test="${currentRole == 3}">User</c:when>
            </c:choose>
            )
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
          <a href="/subpages/license.jsp">MIT License</a>.
        </p>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
