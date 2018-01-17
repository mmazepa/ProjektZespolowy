<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../../static/javascript/main.js"></script>
    <jsp:useBean id="att" class="domain.Attendance" scope="session" />
	  <jsp:setProperty name="att" property="*" />
	  <jsp:useBean id="attstorage" class="service.AttendanceManager" scope="application" />
	</head>
  <body onload="loadHeaderAndFooter()">
    <header></header>
    <main>
      <div class="centeredText">
        <h3>User Panel Leave Workgroup</h3>

        <div id="customPanel">
          <p id="customPanelInfo">
            Please confirm you want to leave workgroup.
          </p>

        	<form action="/doRemoveAttendanceByUser" style="margin-left:0.1in; display:inline" method="post">
        		<input type="hidden" name="id" value="<%= request.getParameter("id") %>" />
        		<input type="hidden" name="group" value="<%= request.getParameter("group") %>" />
        		<input class="btn btn-danger" type="submit" value="Confirm" style="display:inline">
        	</form>
        </div>

        <a id="backLink" href="/subpages/loggedUserMainMenu.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
  </body>
</html>
