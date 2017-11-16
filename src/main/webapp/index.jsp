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
	<body onload="loadHeaderAndFooter()">
    <header id="header"></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Welcome to Editor On-Line</h3>
        <hr/>
        <p>
          We're glad to see you visiting our site!<br/>
          We'll be pleased, if you mind check functionality prepared for you.<br/>
          Log in, if you have an account, or register, if you want to have one.
        </p>

        <!-- LOGGING IN SECTION -->
        <div class="authorization">
          <form>
            Login<br/>
            <input  id="login"
                    class="credentials"
                    type="text"
                    name="login"
                    maxlength="20"
                    pattern="[A-Za-z]{3,20}"
                    title="All letters allowed, min 3, max 20."/>
            <br/>
            Password<br/>
            <input id="password" class="credentials" type="password" name="password"/><br/>
            <!-- LOG IN BUTTON -->
            <input  id="loginButton"
                    type="button"
                    class="btn btn-success"
                    value="Log In"
                    onclick="checkCredentials()"/>
          </form>
          <br/>
          <p id="loginInfo">Hello!</p>
        </div>

        <p>
          Don't have an account? Want one? Just use our
          <a href="subpages/register.jsp">register</a> form.
        </p>
        <p id="adminPanel">
          <span class="glyphicon glyphicon-sunglasses"></span>

          <!-- ADMINISTRATOR PANEL -->
          <a href="/subpages/admin.jsp">Administrator panel</a>

          <span class="glyphicon glyphicon-sunglasses"></span>
        </p>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
