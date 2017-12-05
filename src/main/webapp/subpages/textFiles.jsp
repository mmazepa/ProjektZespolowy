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
        <h4>List of text files</h4>
        <br/>
        <table class="adminTable textFileTable">
          <tr>
            <th>No.</th>
            <th>Author</th>
            <th>Group</th>
            <th>Name</th>
            <th>Creation Date</th>
			      <th>Description</th>
						<th>Private</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
					<c:set var="count" value="0" />
          <c:forEach var="textFile" items="${textFiles}">
      		<tr>
      			<td>
							<c:set var="count" value="${count + 1}" />
							<c:out value="${count}" />
						</td>
					  <td><c:out value="${textFile.getAuthor()}"/></td>
      			<td><c:out value="${textFile.getGroup()}"/></td>
  					<td><c:out value="${textFile.getName()}"/></td>
  					<td><c:out value="${textFile.getCreationDate()}"/></td>
  					<td><c:out value="${textFile.getDescription()}"/></td>
						<td><c:out value="${textFile.isPrivate()}"/></td>
              <td>
                <form action="/subpages/obtainEditedTextFileData.jsp" style="display:inline">
      						<input type="hidden" name="id" value="${textFile.getID()}">
      						<input type="hidden" name="name" value="${textFile.getName()}">
      						<input type="hidden" name="description" value="${textFile.getDescription()}">
							<input type="hidden" name="private" value="${textFile.isPrivate()}">
      						<button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil"></span>
      						</button>
                </form>
              </td>
  			  		<td>
                <form action="/subpages/removeTextFile.jsp" style="display:inline" method="get">
							<input type="hidden" name="id" value="${textFile.getID()}">
      						<input type="hidden" name="name" value="${textFile.getName()}">
      						<input type="hidden" name="description" value="${textFile.getDescription()}">
							<input type="hidden" name="private" value="${textFile.isPrivate()}">
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
