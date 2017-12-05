<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.AccountManager"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    <%
      AccountManager am = new AccountManager();
      String currentNickname = am.activeAccountNickname;
      int currentRole = am.activeAccountRole;
      request.setAttribute("currentNickname", currentNickname);
      request.setAttribute("currentRole", currentRole);
    %>
    <main>
      <!-- IF USER IS LOGGED IN -->
      <c:if test="${currentNickname != ''}">
        <h5 id="helloUser">
          <table id="helloUserTable">
            <tr>
              <td>
                <strong>HELLO!</strong>
                You are logged as <strong><%= currentNickname %></strong>
                (
                <c:choose>
                  <c:when test="${currentRole == 1}">Administrator</c:when>
                  <c:when test="${currentRole == 2}">Moderator</c:when>
                  <c:when test="${currentRole == 3}">User</c:when>
                </c:choose>
                )
              </td>
              <td>
                <form name="form" action="/subpages/loggedUserMainMenu.jsp" method="POST">
  	              <button id="backToMenuButton"
  	                      class="btn btn-danger">
  	                <span class="glyphicon glyphicon-arrow-left"></span>
  	                Back to Main Menu
  	              </button>
  							</form>
              </td>
              <td>
  							<form name="form" action="/doLogout" method="POST">
  	              <button id="logoutButton"
  	                      class="btn btn-danger"
  	                      onclick="logout()">
  	                <span class="glyphicon glyphicon-log-out"></span>
  	                Log Out
  	              </button>
  							</form>
              </td>
            </tr>
          </table>
        </h5>
        <div class="row editorSpace">
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
              <button type=button class="btn btn-primary" onclick="change()">
                <span class="glyphicon glyphicon-edit"></span>
                Change mode
              </button>
            </p>

            <!-- FILE UPLOADER TO EDITOR -->
            <table>
              <tr>
                <td>
                  <label>Choose file to upload:</label>
                  <input id="file" type="file" name="file" />
                </td>
                <td>
                    <button type="button"
                            class="btn btn-primary"
                            onclick="uploadToEditor()">
                      <span class="glyphicon glyphicon-open"></span>
                      Upload to editor
                    </button>
                </td>
              </tr>
            </table>

  					<!-- CODE_MIRROR STARTING SCRIPT -->
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
                <div class="alert alert-info">
                  <strong>SYSTEM:</strong> Welcome to chat.
                  Type something and press the paper aeroplan
                  to send it.
                </div>
              </div>
  						<form onsubmit="addMessage('<%= currentNickname %>'); return false;">
  	            <div id="chatTyping">
  	              <strong><%= currentNickname %>:</strong>
  	              <input id="message" type="text" name="message"/>
  	              <button id="sendMessage"
  												type="submit"
  	                      class="btn btn-success">
  	                  <span class="glyphicon glyphicon-send"></span>
                      Send
  	              </button>
  	            </div>
  						</form>
            </div>
          </div>
        </div>
      </c:if>

      <!-- IF USER IS NOT LOGGED IN -->
      <c:if test="${currentNickname == ''}">
        <h5 id="helloGuest">
          <strong>HELLO!</strong>
          You are not logged in. Please log in to achieve permission do use editor.
        </h5>
        <a id="backLink" href="/index.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </c:if>
    </main>
    <footer></footer>
	</body>
</html>
