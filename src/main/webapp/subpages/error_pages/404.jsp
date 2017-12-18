<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="/static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="/static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Welcome to Editor On-Line</h3>
        <hr/>
        <h4>Nice try!</h4>
        <p>
          The page you're looking for isn't here.<br/>
          You can back to our Home Page now.
        </p>
        <br/>
        <a id="backLink" href="/index.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span> Back
        </a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
