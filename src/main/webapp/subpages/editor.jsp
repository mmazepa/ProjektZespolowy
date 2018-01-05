<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
<%@ page import="domain.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
		<jsp:useBean id="currentuser" class="domain.UserInfo" scope="session" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <script src="../static/javascript/censorship.js"></script>
    <!-- CODE MIRROR FOR SYNTAX HIGHLIGHTING -->
    <script src="../static/codemirror-5.32.0/lib/codemirror.js"></script>
    <link rel="stylesheet" href="../static/codemirror-5.32.0/lib/codemirror.css">
    <script src="../static/codemirror-5.32.0/addon/selection/active-line.js"></script>
    <script src="../static/codemirror-5.32.0/addon/mode/loadmode.js"></script>
    <script src="../static/codemirror-5.32.0/mode/meta.js"></script>
    <!-- AT LEAST ONE SCRIPT IS PLACED AT THE BOTTOM -->
	</head>
	<body onload="loadHeaderAndFooter(); loadModes();">
    <header></header>
    <%
        UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
        if (info != null) {
            currentuser = info;
        } else {
          //currentuser = new UserInfo();
        }

        String currentNickname = currentuser.getNickName();
        int currentRoleId = currentuser.getRole();
        String currentRole = new String();

        RoleManager db = new RoleManager();
        List<Role> roles = new ArrayList<Role>();
        try {
          roles = db.getAllRoles();
        } catch (SQLException | NullPointerException e) {
          e.printStackTrace();
        }

        for (Role role : roles) {
          if(role.getID() == currentRoleId) {
            currentRole = role.getName();
          }
        }

        request.setAttribute("currentNickname", currentNickname);
        request.setAttribute("currentRole", currentRole);
    %>
    <main>
      <!-- IF USER IS LOGGED IN -->
      <c:if test="${currentNickname != ''}">
        <br/>
        <div class="row editorSpace">
          <div class="col-sm-8">
            <!-- textarea component to be replaced by CodeMirror -->
            <textarea id="code"></textarea>
            <p id="currentMode">
              Current mode: <span id="modeinfo">text/plain</span>
            </p>
            <p>
              <span class="glyphicon glyphicon-edit"></span>
              Select desired mode for syntax highlighting:
              <select id="mode" name="language" onchange="change()">
                  <option disabled="disabled">
                    -- Choose mode --
                  </option>
                  <!-- OPTIONS WILL BE IMPORTED BY JAVASCRIPT -->
              </select>

            <!-- FILE UPLOADER TO EDITOR -->
            <table>
              <tr>
                <td>
                  <label>Choose file to upload:</label>
                  <form enctype="multipart/form-data" method="post">
                    <input id="file" name="file" type="file" />
                  </form>
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
                  <br/>
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
				<div class="centeredText">
	        <h5 id="helloGuest">
	          <strong>HELLO!</strong>
	          You are not logged in. Please log in to achieve permission do use editor.
	        </h5>
	        <a id="backLink" href="/index.jsp">
	          <span class="glyphicon glyphicon-arrow-left"></span>
	          Back
	        </a>
				</div>
      </c:if>
    </main>
    <footer></footer>
    <!-- SCRIPT FOR CODE_MIRROR, MUST BE AT THE BOTTOM -->
    <script src="../static/javascript/editor.js"></script>
	</body>
</html>
