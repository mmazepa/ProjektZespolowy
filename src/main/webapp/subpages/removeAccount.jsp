<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@page import="java.sql.SQLException"%>
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
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel Delete</h3>
        <hr/>
        <h4>Delete user</h4>
        <br/>
	<%
	try {
		AccountManager am = new AccountManager();
	  	try {
			am.deleteAccount(Integer.parseInt(request.getParameter("id")));
  			out.println("<p><h3>Account deleted</h3></p>");
		} catch (SQLException e) {
			out.println("<p><h3>SQL exception</h3></p>");
		}
	} catch (NumberFormatException e) {
		out.println("<p><h3>SQL exception</h3></p>");
	}
	%>
	<p>
  		<a href="/subpages/accounts.jsp">back</a>
	</p>
</body>
</html>