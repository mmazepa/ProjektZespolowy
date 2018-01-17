<%@page import="domain.Role"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <jsp:useBean id="role" class="domain.Role" scope="session" />
    <jsp:useBean id="currentrole" class="domain.Role" scope="session" />
	<jsp:useBean id="storage" class="service.RoleManager" scope="application" />
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel Edit</h3>
        <hr/>
        <h4>Edit role</h4>
        <br/>
        <table class="adminTable roleTable">
          <tr>
            <th>Input</th>
            <th>Type</th>
          </tr>
          <form action="/doEditRole" style="margin-left:0.1in" method="post">
          	<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
            <tr>
              <td>Name</td>
              <td><input type="text" name="name" value="<%=request.getParameter("name")%>"></td>
            </tr>
            <tr>
              <td>Submit</td>
        			<td>
                <button type="submit" class="btn btn-success">
                  <span class="glyphicon glyphicon-ok"></span>
                </button>
              </td>
            </tr>
      		</form>
        </table>

        <a id="backLink" href="/roles">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
