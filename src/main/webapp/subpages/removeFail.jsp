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
    <main>
      <div class="centeredText">
        <h3>Remove Fail!</h3>
        <div id="customPanel">
          <p id="customPanelInfo">
            An error occured when removing a record.
          </p>
        </div>

        <a id="backLink" href="admin.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
