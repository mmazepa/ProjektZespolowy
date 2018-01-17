<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <jsp:useBean id="group" class="domain.Workgroup" scope="session" />
	  <jsp:setProperty name="group" property="*" />
	  <jsp:useBean id="groupstorage" class="service.WorkgroupManager" scope="application" />
	</head>
  <body onload="loadHeaderAndFooter()">
    <header></header>
    <main>
      <div class="centeredText">
        <h3>Administrator Panel Delete</h3>

        <div id="customPanel">
          <p id="customPanelInfo">
            Please confirm you want to remove that record.
          </p>

        	<%
          	group = groupstorage.getWorkgroup(Integer.parseInt(request.getParameter("id")));
        	%>
        	<form action="/doRemoveWorkgroup" style="margin-left:0.1in; display:inline" method="post">
        		<input type="hidden" name="id" value="<%= request.getParameter("id") %>" />
        		<b>Name:</b> <jsp:getProperty name="group" property="name"></jsp:getProperty>
            <br/>
            <br/>
        		<input class="btn btn-danger" type="submit" value=" Confirm " style="display:inline">
        	</form>
      	</div>
        <a id="backLink" href="/workgroups">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
</body>
</html>
