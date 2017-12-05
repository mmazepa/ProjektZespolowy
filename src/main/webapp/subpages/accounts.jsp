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
        <h4>List of registered users</h4>
        <br/>
        <table class="adminTable accountTable">
          <tr>
            <th>No.</th>
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
          <c:set var="count" value="0" />
          <c:forEach var="account" items="${accounts}">
      			<tr>
      				<td>
                <%-- <c:out value="${account.getID()}"/> --%>
                <c:set var="count" value="${count + 1}" />
                <c:out value="${count}" />
              </td>
              <td style="font-size: 12px;">
                <%-- <c:out value="${account.getRole()}"/> --%>
                <c:choose>
                  <c:when test="${account.getRole() == '1'}">
                    Administrator
                  </c:when>
                  <c:when test="${account.getRole() == '2'}">
                    Moderator
                  </c:when>
                  <c:when test="${account.getRole() == '3'}">
                    User
                  </c:when>
                </c:choose>
              </td>
      				<td><c:out value="${account.getNickname()}"/></td>
              <td>
                <a href="mailto:${account.getEmail()}">
                  <c:out value="${account.getEmail()}"/>
                </a>
              </td>
              <%-- <td><c:out value="${account.getPass()}"/></td> --%>
              <td>**********</td>
              <td>
                <abbr title="${account.getRegistrationdate().substring(0,16)}">
                  <c:out value="${account.getRegistrationdate().substring(0,10)}"/>
                </abbr>
              </td>
              <td><c:out value="${account.getDescription()}"/></td>
              <td><c:out value="${account.getFirstName()}"/></td>
              <td><c:out value="${account.getLastName()}"/></td>
              <td><c:out value="${account.getDateOfBirth().substring(0,10)}"/></td>
              <td>
                <form action="/subpages/obtainEditedAccountData.jsp" style="display:inline">
      						<input type="hidden" name="id" value="${account.getID()}">
      						<input type="hidden" name="role" value="${account.getRole()}">
      						<input type="hidden" name="nickname" value="${account.getNickname()}">
      						<input type="hidden" name="email" value="${account.getEmail()}">
      						<input type="hidden" name="pass" value="${account.getPass()}">
      						<input type="hidden" name="registrationdate" value="${account.getRegistrationdate()}">
      						<input type="hidden" name="description" value="${account.getDescription()}">
      						<input type="hidden" name="firstName" value="${account.getFirstName()}">
      						<input type="hidden" name="lastName" value="${account.getLastName()}">
      						<input type="hidden" name="dateOfBirth" value="${account.getDateOfBirth()}">
      						<button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil"></span>
      						</button>
                </form>
              </td>
  			  		<td>
                <form action="/subpages/removeAccount.jsp" style="display:inline" method="get">
      						<input type="hidden" name="id" value="${account.getID()}">
      						<input type="hidden" name="nickname" value="${account.getNickname()}">
      						<input type="hidden" name="email" value="${account.getEmail()}">
      						<input type="hidden" name="firstName" value="${account.getFirstName()}">
      						<input type="hidden" name="lastName" value="${account.getLastName()}">
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
