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
    <script src="../static/codemirror-5.32.0/addon/selection/active-line.js"></script>
    <script src="../static/codemirror-5.32.0/addon/mode/loadmode.js"></script>
    <script src="../static/codemirror-5.32.0/mode/meta.js"></script>
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
        <!-- "user" is currently used username -->
        You are logged as <strong>user</strong>
        (<a href="../index.jsp">logout</a>)
      </h5>
      <div class="row">
        <div class="col-sm-8">
          <!-- textarea component to be replaced by CodeMirror -->
          <textarea id="code"></textarea>
          <p style="color: gray;">
            Current mode: <span id="modeinfo">text/plain</span>
          </p>
          <p>
            Select desired mode for syntax highlighting:
            <select id="mode" name="language">
                <option disabled="disabled">Choose one...</option>
                <option value="1">text/plain</option>
                <option value="2">javascript</option>
                <option value="3">xml</option>
                <option value="4">css</option>
            </select>
            <button type=button class="btn btn-primary" onclick="change()">change mode</button>
          </p>
          <script>
            var myTextArea = document.getElementById("code");
            var myCodeMirror = CodeMirror(function(elt) {
              myTextArea.parentNode.replaceChild(elt, myTextArea);
            }, {
                // CodeMirror options
                value: myTextArea.value,
                styleActiveLine: true,
                lineNumbers: true,
                lineWrapping: true
              });

              // CHANGING MODES/LANGUAGES
              CodeMirror.modeURL = "../static/codemirror-5.32.0/mode/%N/%N.js";
              var selectBox = document.getElementById("mode");
              var modeInput = selectBox.options[selectBox.selectedIndex].text;
              CodeMirror.on(modeInput, "keypress", function(e) {
                if (e.keyCode == 13) change();
              });
              function change() {
                var selectBox = document.getElementById("mode");
                var modeInput = selectBox.options[selectBox.selectedIndex].text;
                var val = modeInput, m, mode, spec;
                if (m = /.+\.([^.]+)$/.exec(val)) {
                  var info = CodeMirror.findModeByExtension(m[1]);
                  if (info) {
                    mode = info.mode;
                    spec = info.mime;
                  }
                } else if (/\//.test(val)) {
                  var info = CodeMirror.findModeByMIME(val);
                  if (info) {
                    mode = info.mode;
                    spec = val;
                  }
                } else {
                  mode = spec = val;
                }
                if (mode) {
                  myCodeMirror.setOption("mode", spec);
                  CodeMirror.autoLoadMode(myCodeMirror, mode);
                  document.getElementById("modeinfo").textContent = spec;
                } else {
                  alert("Could not find a mode corresponding to " + val);
                }
              }
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
              <!-- "user" is currently used username -->
              <strong>user:</strong>
              <input id="message" type="text" name="message"/>
              <button id="sendMessage"
                      class="btn btn-success"
                      onclick="addMessage()">
                  <span class="glyphicon glyphicon-send"></span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
