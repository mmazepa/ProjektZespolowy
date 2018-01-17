<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!--<%@ page import="service.AccountManager"%>-->
<%@page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
    <jsp:useBean id="acc" class="domain.Account" scope="session" />
  	<jsp:setProperty name="acc" property="*" />
  	<jsp:useBean id="accstorage" class="service.AccountManager" scope="application" />
	</head>
  <body onload="loadHeaderAndFooter()">
    <header></header>
    <main>
      <div class="centeredText">
        <h3>Administrator Panel Delete</h3>

        <div id="customPanel">
          <p id="customPanelInfo">
            Please confirm you want to remove that record.
          </p>
        </div>

        <br/>
      	<%
        	acc = accstorage.getAccount(Integer.parseInt(request.getParameter("id")));
      	%>
        <table class="adminTable accountTable">
          <tr>
            <th>Property</th>
            <th>Value</th>
          </tr>
        	<form action="/doRemoveAccount" style="margin-left:0.1in; display:inline" method="post">
        		<input type="hidden" name="id" value="<%= request.getParameter("id") %>" />
            <tr>
        		   <td>
                 <b>Nickname</b>
               </td>
               <td>
                 <jsp:getProperty name="acc" property="nickname"></jsp:getProperty>
               </td>
            </tr>
            <tr>
        		  <td>
                <b>Email</b>
              </td>
              <td>
                <jsp:getProperty name="acc" property="email"></jsp:getProperty>
              </td>
            </tr>
            <tr>
          	   <td>
                 <b>Name</b>
               </td>
               <td>
                 <jsp:getProperty name="acc" property="firstName"></jsp:getProperty>
               </td>
            </tr>
            <tr>
          		<td>
                <b>Surname</b>
              </td>
              <td>
                <jsp:getProperty name="acc" property="lastName"></jsp:getProperty>
              </td>
            </tr>
            <tr>
          		<td colspan="2" style="text-align:center;">
                <input class="btn btn-danger" type="submit" value=" Confirm " style="display:inline">
              </td>
            </tr>
        	</form>
        </table>

        <a id="backLink" href="/accounts">
          <span class="glyphicon glyphicon-arrow-left"></span>
          Back
        </a>
      </div>
    </main>
    <footer></footer>
  </body>
</html>
