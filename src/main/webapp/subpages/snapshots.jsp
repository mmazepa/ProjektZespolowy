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
        <h4>List of snapshots</h4>
        <br/>
        <table id="adminTable">
          <tr>
            <th>ID</th>
            <th>Author</th>
            <th>File</th>
            <th>Name</th>
            <th>Creation Date</th>
			      <th>Content</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
          <c:forEach var="snapshot" items="${snapshots}">
      		<tr>
      			<td><c:out value="${snapshot.getID()}"/></td>
					  <td><c:out value="${snapshot.getAuthor()}"/></td>
      			<td><c:out value="${snapshot.getFile()}"/></td>
  					<td><c:out value="${snapshot.getName()}"/></td>
  					<td><c:out value="${snapshot.getCreationDate()}"/></td>
  					<td><c:out value="${snapshot.getContent()}"/></td>
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
