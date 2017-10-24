<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="static/javascript/main.js"></script>
	</head>
	<body>
    <header>
      <span class="glyphicon glyphicon-globe"></span>
      Editor On-Line for programmatic cooperation in real-time
    </header>
    <main>
      <br/>
      <h3 id="helloUser">...</h3>
      <textarea placeholder="Enter some code... " class="mainEditor"></textarea>
      <div id="underRow" class="row">
        <div id="col1" class="col-sm-8">
          <p class="bold">
            <span class="glyphicon glyphicon-triangle-right"></span>
            Programming Language:
          </p>
          <select id="languages" name="language">
              <option disabled="disabled">Choose one...</option>
          		<option>C</option>
          		<option>C++</option>
              <option>Java</option>
              <option>Plain Text</option>
        	</select>
          <button onclick="changeLanguage()" class="btn btn-success">Change</button>
        </div>
        <div id="col2" class="col-sm-4">
          <p class="bold">Currently used:</p>
          <p id="usedLanguage">C (default)</p>
        </div>
      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
