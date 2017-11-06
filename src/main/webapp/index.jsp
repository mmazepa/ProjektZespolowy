<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="static/css/main.css" />
    <link type="text/css" rel="stylesheet" href="static/css/buttons.css" />
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
        <h3>Welcome to Editor On-Line</h3>
        <hr/>
        <p>
          We're glad to see you visiting our site! We'll be pleased,
          if you mind check functionality prepared for you. Log in,
          if you have an account, or register, if you want to have one.
        </p>
        <br/>

        <!-- LOGGING IN SECTION -->
        <div class="authorization">
          <form>
            Login<br/>
            <input id="login" class="credentials" type="text" name="login"/><br/>
            Password<br/>
            <input id="password" class="credentials" type="password" name="password"/><br/>
            <!-- LOG IN BUTTON -->
            <input  id="button"
                    type="button"
                    class="btn btn-success"
                    value="Log In"
                    onclick="checkCredentials()"/>
          </form>
        </div>
        <br/>
        <br/>

        <p>
          Don't have an account? Want one? Just use our
          <a href="subpages/register.jsp">register</a> form.
        </p>
        <p>
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="glyphicon glyphicon-chevron-right"></span>
          <a href="subpages/admin.jsp">[ Administrator panel ]</a>
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="glyphicon glyphicon-chevron-left"></span>
        </p>
      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
