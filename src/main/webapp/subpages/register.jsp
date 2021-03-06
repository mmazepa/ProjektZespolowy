<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.Timestamp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Register Form</h3>

        <!-- REGISTER SECTION -->
        <div id="customPanel">
          <p id="customPanelInfo">
            Enter your data, at least required ones, and press Register button to submit.
          </p>
          <div class="authorization">
            <form action="/doCreateAccount" method="POST">
              <table id="registerTable">
                <tr>
                  <td>Login <sup>* required</sup></td>
                  <td>
                    <input  id="login"
                            class="credentials"
                            type="text"
                            name="nickname"
                            maxlength="20"
                            pattern="[a-zA-Z0-9_.-]{3,20}"
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
                            name="firstName"
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
                            name="lastName"
                            maxlength="20"
                            pattern="([A-ZĄĆĘŁŃÓŚŻŹ]{1}[a-ząćęłńóśżź]*.{2,20})"
                            title="First letter uppercase and the rest lowercase, min 3, max 20."/>
                  </td>
                </tr>
                <tr>
                  <td>E-mail Address<sup>* required</sup></td>
                  <td>
                    <input  id="email"
                            class="credentials"
                            type="email"
                            name="email"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
                            title="Regular form of e-mail address."
                            required/>
                  </td>
                </tr>
                <tr>
                  <td>Date of Birth</td>
                  <td>
                    <input  id="birth"
                            class="credentials"
                            type="text"
                            name="dateOfBirth"
                            pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
                            value="1970-01-01"
                            title="YYYY-MM-DD, e.g. 1990-01-01."/>
                  </td>
                </tr>
                <tr>
                  <td>Password <sup>* required</sup></td>
                  <td>
                    <input  id="passw"
                            class="credentials"
                            type="password"
                            name="pass"
                            required/>
                  </td>
                </tr>
              </table>
              <!-- REGISTER BUTTON -->
              <input  id="registerButton"
                      type="submit"
                      class="btn btn-primary"
                      value="Register"/>
            </form>
          </div>
        </div>

        <a id="backLink" href="../index.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
