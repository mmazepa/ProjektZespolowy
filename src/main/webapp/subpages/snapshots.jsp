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
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel</h3>
        <hr/>
        <h4>List of snapshots</h4>
        <br/>
        <table class="adminTable snapshotTable">
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
              <td>
                <form action="/subpages/obtainEditedSnapshotData.jsp" style="display:inline">
      						<input type="hidden" name="id" value="${snapshot.getID()}">
      						<input type="hidden" name="author" value="${snapshot.getAuthor()}">
      						<input type="hidden" name="file" value="${snapshot.getFile()}">
      						<input type="hidden" name="name" value="${snapshot.getName()}">
      						<input type="hidden" name="creationDate" value="${snapshot.getCreationDate()}">
      						<input type="hidden" name="content" value="${snapshot.getContent()}">
      						<button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil"></span>
      						</button>
                </form>
              </td>
  			  		<td>
                <form action="/subpages/removeSnapshot.jsp" style="display:inline" method="get">
      						<input type="hidden" name="id" value="${snapshot.getID()}">
      						<input type="hidden" name="author" value="${snapshot.getAuthor()}">
      						<input type="hidden" name="file" value="${snapshot.getFile()}">
      						<input type="hidden" name="name" value="${snapshot.getName()}">
                  <button type="submit" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
      						</button>
						    </form>
					    </td>
  				</tr>
          </c:forEach>
        </table>
        <br/>
        <a href="/subpages/admin.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
