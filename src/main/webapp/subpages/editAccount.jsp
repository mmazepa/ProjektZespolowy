<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="domain.Account"%>
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
        <h3>Administrator Panel Edit</h3>
        <hr/>
        <h4>Edit user</h4>
        <br/>
	<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		int role = Integer.parseInt(request.getParameter("role"));
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String registrationdate = request.getParameter("registrationdate");
		String description = request.getParameter("description");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String dateOfBirth = request.getParameter("dateOfBirth");
		Account newAccount = new Account( id,  role,  nickname,  email,
				 pass,  registrationdate,  description,
				 firstName,  lastName,  dateOfBirth);
		AccountManager am = new AccountManager();
		try {
			am.editAccount(id, newAccount);
  			out.println("<p><h3>Account edited</h3></p>");
		} catch (SQLException e) {
			out.println("<p><h3>SQL exception</h3></p>");
		}
	} catch (NumberFormatException e) {
		out.println("<p><h3>SQL exception</h3></p>");
	}
	%>
	<p>
  		<a href="/accounts">back</a>
	</p>
</body>
</html>
