<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="storage" class="service.RoleManager" scope="application" />
<title>Insert title here</title>
</head>
<body>
	<table id="adminTable">
          <tr>
            <th>ID</th>
            <th>Role</th>
            <th>Nickname</th>
            <th>E-mail</th>
            <th>Password</th>
            <th>Registration Date</th>
            <th>Description</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Date Of Birth</th>
            <th>Edit</th>
            <th>Delete</th>
          </tr>
          <c:forEach var="account" items="${roles}">
      			<tr>
      				<td><c:out value="${account.getID()}"/></td>
              <td><c:out value="${account.getRole()}"/></td>
      				<td><c:out value="${account.getNickname()}"/></td>
              <td><c:out value="${account.getEmail()}"/></td>
              <td><c:out value="${account.getPass()}"/></td>
              <td><c:out value="${account.getRegistrationdate()}"/></td>
              <td><c:out value="${account.getDescription()}"/></td>
              <td><c:out value="${account.getFirstName()}"/></td>
              <td><c:out value="${account.getLastName()}"/></td>
              <td><c:out value="${account.getDateOfBirth()}"/></td>
              <td><span class="glyphicon glyphicon-pencil"></span></td>
              <td><span class="glyphicon glyphicon-remove"></span></td>
            </tr>
          </c:forEach>
        </table>
</body>
</html>