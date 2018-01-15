<%@page import="service.TextFileManager"%>
<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
<%@ page import="domain.Role"%>
<%@ page import="domain.TextFile"%>
<%@ page import="service.WorkgroupManager"%>
<%@ page import="domain.Workgroup"%>
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
    <script src="../static/javascript/editorForFileContent.js"></script>

    <!-- CODE MIRROR FOR SYNTAX HIGHLIGHTING -->
    <script src="../static/codemirror-5.32.0/lib/codemirror.js"></script>
    <link rel="stylesheet" href="../static/codemirror-5.32.0/lib/codemirror.css">
    <script src="../static/codemirror-5.32.0/addon/selection/active-line.js"></script>
    <script src="../static/codemirror-5.32.0/addon/mode/loadmode.js"></script>
    <script src="../static/codemirror-5.32.0/mode/meta.js"></script>

    <!-- AJAX STUFF -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- AJAX SCRIPT MOVED TO EDITOR.JS SCRIPT -->

    <!-- AT LEAST ONE SCRIPT IS PLACED AT THE BOTTOM -->
	</head>
	<body onload="loadHeaderAndFooter(); loadModes(); manageUrlParams();">
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

        TextFileManager dbt = new TextFileManager();
        request.setAttribute("currentNickname", currentNickname);
        request.setAttribute("currentRole", currentRole);
        String forMessageAuthor = request.getParameter("author");
        String forMessageFile = request.getParameter("file");
        TextFile fifi = dbt.getTextFile(Integer.parseInt(forMessageFile));
        String currentFileName = dbt.getTextFile(Integer.parseInt(forMessageFile)).getName();
        String forMessageGroup = request.getParameter("group");

        String chatHeaderGroupName = new String();
        int chatHeaderGroupId = Integer.parseInt(request.getParameter("group"));

        WorkgroupManager wm = new WorkgroupManager();
        List<Workgroup> workgroups = new ArrayList<Workgroup>();
        try {
          workgroups = wm.getAllWorkgroups();
        } catch (SQLException | NullPointerException e) {
          e.printStackTrace();
        }

        for (Workgroup workgroup : workgroups) {
          if(workgroup.getID() == chatHeaderGroupId) {
            chatHeaderGroupName = workgroup.getName();
          }
        }

        String dacontent;
        try {
        	dacontent = dbt.getNewestContent(fifi);
        } catch (SQLException e) {
        	dacontent = "";
        }
    %>
    <main>
      <!-- IF USER IS LOGGED IN -->
      <c:if test="${currentNickname != ''}">
        <br/>
        <div class="row editorSpace">
          <div class="col-sm-8">
            <p id="editorForFileContentInfo">
              Currently edited file is made by
              <strong> <%= currentNickname %> </strong>
              and it's name is
              <strong> <%= currentFileName %> </strong>
            </p>
            <!-- textarea component to be replaced by CodeMirror -->
            <textarea id="code" class="codemirror-textarea"><%= dacontent %></textarea>
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
               <tr>
               <td></td>
                <td>
                  <%-- <form id="formSave" action="/ajx/doSaveFile" method="GET"> --%>
                  <form id="formSave" onclick="realTime();" action="/ajx/doSaveFile" method="GET">
                    <input type="hidden" name="author" value="<%= forMessageAuthor %>">
              			<input type="hidden" name="group" value="<%= forMessageGroup %>">
              			<input type="hidden" name="file" value="<%= forMessageFile %>">
              			<input type="hidden" name="name" value="<%= currentNickname %>">
                    <input id="content" type="hidden" name="content" value="">
                	<!-- SAVE BUTTON -->
                	<button  id="saveButton"
                		type="submit"
                        class="btn btn-success"
                        value="">
                    <span class="glyphicon glyphicon-save"></span>
                    	Save to Your Workgroup Storage
                	</button>
              		</form>
                </td>
                <td>
                	<div id="saveresponse"></div>
                </td>
              </tr>
            </table>
          </div>
          <div class="col-sm-4">
            <div class="chat">
              <p id="chatHeader">
                <strong> <%= chatHeaderGroupName %> </strong>
              </p>
              <div id="messages">
                <div class="alert alert-info">
                  <strong>SYSTEM:</strong> Welcome to chat.
                  Type something and press the paper aeroplan
                  to send it.
                </div>
              </div>
  						<form onsubmit="addMessage(<%= forMessageAuthor %>,'<%= currentNickname %>',<%= forMessageGroup %>); return false;">
  						    <input type="hidden" name="author" value="<%= forMessageAuthor %>">
          				<input type="hidden" name="group" value="<%= forMessageGroup %>">
          				<input type="hidden" name="file" value="<%= forMessageFile %>">
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
