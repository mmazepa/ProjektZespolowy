<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <!-- CODE MIRROR FOR SYNTAX HIGHLIGHTING -->
    <script src="../static/codemirror-5.32.0/lib/codemirror.js"></script>
    <link rel="stylesheet" href="../static/codemirror-5.32.0/lib/codemirror.css">
    <script src="../static/codemirror-5.32.0/mode/javascript/javascript.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main>
      <br/>
      <p>
        Some parts of this site is working under
        <a href="license.jsp">MIT License</a>,
        e.g. CodeMirror.
      </p>
      <h5 id="helloUser">
        <strong>HELLO!</strong>
        You are logged as <strong>user</strong> <!-- "user" is currently used username -->
        (<a href="../index.jsp">logout</a>)
      </h5>
      <div class="row">
        <div class="col-sm-8">
          <textarea id="code" placeholder="Enter some code... " class="mainEditor"></textarea>
          <script>
            var myTextArea = document.getElementById("code");
            var myCodeMirror = CodeMirror(function(elt) {
              myTextArea.parentNode.replaceChild(elt, myTextArea);
            }, {value: myTextArea.value, lineNumbers: true});
          </script>
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
          		<%-- <option>C</option>
          		<option>C++</option>
              <option>Java</option>
              <option>Plain Text</option> --%>
              <option>JavaScript</option>
        	</select>
          <button onclick="changeLanguage()" class="btn btn-success">Change</button>
        </div>
        <div id="col2" class="col-sm-4">
          <p class="bold">Currently used:</p>
          <p id="usedLanguage">JavaScript (default)</p>
        </div>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
