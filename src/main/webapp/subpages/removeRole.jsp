<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!--<%@ page import="service.RoleManager"%>-->
<%@page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <jsp:useBean id="acc" class="domain.Role" scope="session" />
	<jsp:setProperty name="acc" property="*" />
	<jsp:useBean id="storage" class="service.RoleManager" scope="application" />
	</head>
<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel Delete</h3>
        <hr/>
        <h4>Please confirm you want to remove that record.</h4>
        <br/>
	<% 
  	acc = storage.getRole(Integer.parseInt(request.getParameter("id")));
	%>
	<form action="/doRemoveRole" style="margin-left:0.1in; display:inline" method="post">
		<input type="hidden" name="id" value="<%= request.getParameter("id") %>" />
		<p><b>Name:</b> <jsp:getProperty name="acc" property="name"></jsp:getProperty></p>
		<input class="button" type="submit" value=" Confirm " style="display:inline">
	</form>
	<br/>
	<p>
  		<a href="/roles">Back</a>
	</p>
</body>
</html>
