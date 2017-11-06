<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link type="text/css" rel="stylesheet" href="../static/css/buttons.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="static/javascript/main.js"></script>
	</head>
	<body>
    <header>
      <span class="glyphicon glyphicon-globe"></span>
      Editor On-Line for programmatic cooperation in real-time
    </header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Register Form</h3>
        <hr/>

        <!-- REGISTER SECTION -->
        <div class="authorization">
          <form action="editor.jsp">
            Login <sup>* required</sup><br/>
            <input class="credentials" type="text" name="login"/><br/>
            First Name<br/>
            <input class="credentials" type="text" name="firstname"/><br/>
            Last Name<br/>
            <input class="credentials" type="text" name="lastname"/><br/>
            Password <sup>* required</sup><br/>
            <input class="credentials" type="password" name="password"/><br/>
            <!-- REGISTER BUTTON -->
            <input  id="button"
                    type="submit"
                    class="btn btn-primary"
                    value="Register"/>
          </form>
        </div>

      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
