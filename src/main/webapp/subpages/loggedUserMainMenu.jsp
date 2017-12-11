<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.AccountManager"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <%
      AccountManager am = new AccountManager();
      String currentNickname = am.activeAccountNickname;
      int currentRole = am.activeAccountRole;
      request.setAttribute("currentNickname", currentNickname);
      request.setAttribute("currentRole", currentRole);
    %>
    <main>
      <div class="centeredText">
        <h3>Logged User Main Menu</h3>
        <hr/>

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
            Use buttons below to achieve prefered destination.
          </p>

          <!-- IF USER IS ADMINISTRATOR -->
          <c:if test="${currentRole == 1}">
            <form action="/subpages/admin.jsp" method="post">
              <button id="userButton01" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-wrench"></span>
                Administrator Panel
              </button>
            </form>
          </c:if>

          <!-- IF USER IS MODERATOR -->
          <c:if test="${currentRole == 2}"></c:if>

          <!-- IF USER IS USER -->
          <c:if test="${currentRole == 3}"></c:if>

          <!-- CONTENT FOR EVERYONE -->
          <form action="/subpages/editor.jsp" method="post">
            <button id="userButton02" type="submit" class="btn btn-primary">
              <span class="glyphicon glyphicon-list-alt"></span>
              Editor
            </button>
          </form>
          <form action="/subpages/userFiles.jsp" method="post">
            <button id="userButton05" type="submit" class="btn btn-primary">
              <span class="glyphicon glyphicon-file"></span>
              My Files
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
    </main>
    <footer></footer>
	</body>
</html>
