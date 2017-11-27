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
        <h3>Administrator Panel Edit</h3>
        <hr/>
        <h4>Edit user</h4>
        <br/>
        <table id="adminTable">
          <tr>
            <th>Input</th>
            <th>Type</th>
          </tr>
          <form action="editAccount.jsp" style="margin-left:0.1in" method="post">
            <tr>
              <td>ID</td>
              <td><input type="text" name="id" value="${account.getID()}"></td>
            </tr>
            <tr>
              <td>Role</td>
              <td><input type="text" name="role" value="${account.getRole()}"></td>
            </tr>
            <tr>
              <td>Nickname</td>
              <td><input type="text" name="nickname" value="${account.getNickname()}"></td>
            </tr>
            <tr>
              <td>E-mail</td>
              <td><input type="text" name="email" value="${account.getEmail()}"></td>
            </tr>
            <tr>
              <td>Password</td>
              <td><input type="text" name="pass" value="${account.getPass()}"></td>
            </tr>
            <tr>
              <td>Registration Date</td>
              <td><input type="text" name="registrationdate" value="${account.getRegistrationdate()}"></td>
            </tr>
            <tr>
              <td>Description</td>
              <td><input type="text" name="description" value="${account.getDescription()}"></td>
            </tr>
            <tr>
              <td>Firstname</td>
              <td><input type="text" name="firstName" value="${account.getFirstName()}"></td>
            </tr>
            <tr>
              <td>Lastname</td>
              <td><input type="text" name="lastName" value="${account.getLastName()}"></td>
            </tr>
            <tr>
              <td>Date Of Birth</td>
              <td><input type="text" name="dateOfBirth" value="${account.getDateOfBirth()}"></td>
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
        <br/>
        <a href="/accounts">back</a>
        <br/>
        <br/>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
