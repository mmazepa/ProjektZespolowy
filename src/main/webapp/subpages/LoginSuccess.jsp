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
      <h3>Login Success</h3>
        You have pass the logging in process successfully.<br/>
        Now you can proceed to Editor On-Line and check the functionality.<br/>
        <br/>
        <form action="/subpages/loggedUserMainMenu.jsp" method="post">
          <button type="submit">
            Next <span class="glyphicon glyphicon-arrow-right"></span>
          </button>
        </form>
      </div>
    </main>
    <footer></footer>
	</body>
</html>