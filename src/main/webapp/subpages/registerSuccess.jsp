<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <h3>Register Success</h3>
        You have pass the registration process successfully.<br/>
        Now you can log in to Editor On-Line and check the functionality.<br/>
        <br/>
        <button id="showHide" onclick="getInfo()">Show!</button><br/>
        <br/>
        <b>Login:</b> <span id="login">...</span><br/>
        <b>Fname:</b> <span id="fname">...</span><br/>
        <b>Lname:</b> <span id="lname">...</span><br/>
        <b>Email:</b> <span id="email">...</span><br/>
        <b>Birth:</b> <span id="birth">...</span><br/>
        <b>Passw:</b> <span id="passw">...</span><br/>
        <br/>
        <a href="../index.jsp">back</a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
