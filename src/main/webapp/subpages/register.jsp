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
          <form action="registerSuccess.jsp" onsubmit="saveInfo()" method="POST">
            Enter your data, at least required ones, and press Register button to submit.
            <table id="registerTable">
              <tr>
                <td>Login <sup>* required</sup></td>
                <td>
                  <input  id="login"
                          class="credentials"
                          type="text"
                          name="login"
                          maxlength="20"
                          pattern="[A-Za-z]{3,20}"
                          title="All letters allowed, min 3, max 20."
                          required/>
                </td>
              </tr>
              <tr>
                <td>First Name</td>
                <td>
                  <input  id="fname"
                          class="credentials"
                          type="text"
                          name="firstname"
                          maxlength="20"
                          pattern="([A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśżź]*.{2,20})"
                          title="First letter uppercase and the rest lowercase, min 3, max 20."/>
                </td>
              </tr>
              <tr>
                <td>Last Name</td>
                <td>
                  <input  id="lname"
                          class="credentials"
                          type="text"
                          name="lastname"
                          maxlength="20"
                          pattern="([A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśżź]*.{2,20})"
                          title="First letter uppercase and the rest lowercase, min 3, max 20."/>
                </td>
              </tr>
              <tr>
                <td>E-mail Address</td>
                <td>
                  <input  id="email"
                          class="credentials"
                          type="email"
                          name="email"
                          pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
                          title="Regular form of e-mail address."/>
                </td>
              </tr>
              <tr>
                <td>Date of Birth</td>
                <td><input id="birth" class="credentials" type="date" name="birthdate"/></td>
              </tr>
              <tr>
                <td>Password <sup>* required</sup></td>
                <td><input id="passw" class="credentials" type="password" name="password" required/></td>
              </tr>
            </table>
            <!-- REGISTER BUTTON -->
            <input  id="button"
                    type="submit"
                    class="btn btn-primary"
                    value="Register"/>
          </form>
        </div>

        <a href="../index.jsp">back</a>
      </div>
    </main>
    <footer>
      University of Gdansk © 2017 All Rights Reserved
    </footer>
	</body>
</html>
