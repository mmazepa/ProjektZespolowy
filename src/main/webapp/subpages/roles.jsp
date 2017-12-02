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
        <h4>List of roles</h4>
        <br/>
        <table class="adminTable roleTable">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
          <c:forEach var="role" items="${roles}">
      		<tr>
        		<td><c:out value="${role.getID()}"/></td>
  					<td><c:out value="${role.getName()}"/></td>
              <td>
                <form action="/subpages/obtainEditedRoleData.jsp" style="display:inline">
      						<input type="hidden" name="id" value="${role.getID()}">
      						<input type="hidden" name="name" value="${role.getName()}">
      						<button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil"></span>
      						</button>
                </form>
              </td>
  			  		<td>
                <form action="/subpages/removeRole.jsp" style="display:inline" method="get">
      						<input type="hidden" name="id" value="${role.getID()}">
      						<input type="hidden" name="name" value="${role.getName()}">
                  <button type="submit" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
      						</button>
						    </form>
					    </td>
				  </tr>
          </c:forEach>
        </table>
        <br/>
        <a href="/subpages/admin.jsp">back</a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
