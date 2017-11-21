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
          </tr>
          <form action="editAccount.jsp" style="margin-left:0.1in" method="post">
			<input type="text" name="id" value="${account.getID()}">
			<input type="text" name="role" value="${account.getRole()}">
			<input type="text" name="nickname" value="${account.getNickname()}">
			<input type="text" name="email" value="${account.getEmail()}">
			<input type="text" name="pass" value="${account.getPass()}">
			<input type="text" name="registrationdate" value="${account.getRegistrationdate()}">
			<input type="text" name="description" value="${account.getDescription()}">
			<input type="text" name="firstName" value="${account.getFirstName()}">
			<input type="text" name="lastName" value="${account.getLastName()}">
			<input type="text" name="dateOfBirth" value="${account.getDateOfBirth()}">
			<input type="submit" value=" OK ">
		  </form>
        </table>
        <br/>
        <a href="/subpages/accounts.jsp">back</a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
