<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
	</head>
	<body>
    <header>
      <span class="glyphicon glyphicon-globe"></span>
      Editor On-Line for programmatic cooperation in real-time
    </header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel</h3>
        <hr/>
        Welcome to Administrator Panel.<br/>
        Choose what you want to manage by clicking one of buttons below.<br/>
        <br/>

        <!-- ADMIN BUTTONS SECTION -->
        <div class="adminButtonsGroup">
          <div class="wrapper">
            <button id="accounts"
                    class="adminButtons"
                    onclick="location.assign('/accounts')">
                Accounts
            </button>
            <p class="text">List of users</p>
          </div>
          <div class="wrapper">
            <button id="attendances"
                    class="adminButtons"
                    onclick="location.assign('/attendances')">
                Attendances
            </button>
            <p class="text">List of attendances</p>
          </div>
          <div class="wrapper">
            <button id="roles"
                    class="adminButtons"
                    onclick="location.assign('/roles')">
                Roles
            </button>
            <p class="text">List of roles</p>
          </div>
          <div class="wrapper">
            <button id="snapshots"
                    class="adminButtons"
                    onclick="location.assign('/snapshots')">
                Snapshots
            </button>
            <p class="text">List of snapshots</p>
          </div>
          <div class="wrapper">
            <button id="textFiles"
                    class="adminButtons"
                    onclick="location.assign('/textFiles')">
                Text Files
            </button>
            <p class="text">List of text files</p>
          </div>
          <div class="wrapper">
            <button id="workgroups"
                    class="adminButtons"
                    onclick="location.assign('/workgroups')">
                Workgroups
            </button>
            <p class="text">List of workgroups</p>
          </div>
        </div>

        <br/>
        <br/>
        Administator panel for administrative things.<br/>
        <br/>
        <a href="../index.jsp">back</a>
      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
