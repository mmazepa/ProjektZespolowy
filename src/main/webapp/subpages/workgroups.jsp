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
        <h4>List of workgroups</h4>
        <br/>
        <table class="adminTable workgroupTable">
          <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Creation Date</th>
            <th>Description</th>
            <th>Is Private</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
          <c:set var="count" value="0" />
          <c:forEach var="workgroup" items="${workgroups}">
      		<tr>
        		<td>
              <%-- <c:out value="${workgroup.getID()}"/> --%>
              <c:set var="count" value="${count + 1}" />
              <c:out value="${count}" />
            </td>
  					<td><c:out value="${workgroup.getName()}"/></td>
        		<td><c:out value="${workgroup.getCreationDate()}"/></td>
  					<td><c:out value="${workgroup.getDescription()}"/></td>
  					<td><c:out value="${workgroup.isPrivate()}"/></td>
  					<td><span class="glyphicon glyphicon-pencil"></span></td>
  					<td><span class="glyphicon glyphicon-remove"></span></td>
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
