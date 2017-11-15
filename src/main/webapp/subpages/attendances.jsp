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
	</head>
	<body>
    <header>
      <span class="glyphicon glyphicon-globe"></span>
      Editor On-Line for programmatic cooperation in real-time
    </header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel</h3>
        <hr/>
        <h4>List of attendances</h4>
        <br/>
        <table id="adminTable">
          <tr>
            <th>ID</th>
            <th>Group</th>
            <th>User</th>
            <th>Is Admin</th>
            <th>Join Date</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
          <c:forEach var="attendance" items="${attendances}">
      		<tr>
        		<td><c:out value="${attendance.getID()}"/></td>
  					<td><c:out value="${attendance.getGroup()}"/></td>
        		<td><c:out value="${attendance.getUser()}"/></td>
  					<td><c:out value="${attendance.isAdmin()}"/></td>
  					<td><c:out value="${attendance.getJoinDate()}"/></td>
  					<td><span class="glyphicon glyphicon-pencil"></span></td>
  					<td><span class="glyphicon glyphicon-remove"></span></td>
				  </tr>
          </c:forEach>
        </table>
        <br/>
        <a href="/subpages/admin.jsp">back</a>
      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
