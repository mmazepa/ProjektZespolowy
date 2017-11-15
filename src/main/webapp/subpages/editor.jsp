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
      <br/>
      <h5 id="helloUser">
        <strong>HELLO!</strong>
        You are logged as <strong>user</strong> <!-- "user" is currently used username -->
        (<a href="../index.jsp">logout</a>)
      </h5>
      <div class="row">
        <div class="col-sm-8">
          <textarea placeholder="Enter some code... " class="mainEditor"></textarea>
        </div>
        <div class="col-sm-4">
          <div class="chat">
            <div id="messages">
              <div id="systemMessage">
                <strong>SYSTEM:</strong> Welcome to chat.
                Type some text and press the "Send" button.
              </div>
            </div>
            <div id="chatTyping">
              <strong>user:</strong>
              <input id="message" type="text" name="message"/> <!-- "user" is currently used username -->
              <button id="sendMessage"
                      class="btn btn-success"
                      onclick="addMessage()">
                  <span class="glyphicon glyphicon-send"></span>
              </button>
            </div>
          </div>
        </div>
      </div>
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
    <footer></footer>
	</body>
</html>
