<%@page import="domain.Role"%>
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
    <jsp:useBean id="role" class="domain.Role" scope="session" />
    <jsp:useBean id="currentrole" class="domain.Role" scope="session" />
	<jsp:useBean id="rolestorage" class="service.RoleManager" scope="application" />
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel Edit</h3>
        <hr/>
        <h4>Edit user</h4>
        <br/>
        <table class="adminTable">
          <tr>
            <th>Input</th>
            <th>Type</th>
          </tr>
          <form action="/doEditAccount" style="margin-left:0.1in" method="post">
          	<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
            <tr>
              <td>Role</td>
            <td>
            <%
			try
			{
				%>
				<select name="role" id="choose1" value="<%=Integer.parseInt(request.getParameter("role"))%>">
				<%
				for (Role i : rolestorage.getAllRoles())
     			{
					if (Integer.parseInt(request.getParameter("role")) == i.getID()) {
						%>
	          			<option value="<%=i.getID()%>" selected><%=i.getName()%></option>
						<%
					} else {
						%>
	          			<option value="<%=i.getID()%>"><%=i.getName()%></option>
						<%
					}
     			}
				%>
				</select>
				<%
			} catch (Exception e) {

			}
			%>
			</td>
            </tr>
            <tr>
              <td>Nickname</td>
              <td><input type="text" name="nickname" value="<%=request.getParameter("nickname")%>"></td>
            </tr>
            <tr>
              <td>E-mail</td>
              <td><input type="text" name="email" value="<%=request.getParameter("email")%>"></td>
            </tr>
            <!--<tr>
              <td>Password</td>
              <td><input type="password" name="pass" value="<%=String.(request.getParameter("pass"))%>"></td>
            </tr>-->
            <tr>
              <td>Description</td>
              <td><input type="text" name="description" value="<%=request.getParameter("description")%>"></td>
            </tr>
            <tr>
              <td>Firstname</td>
              <td><input type="text" name="firstName" value="<%=request.getParameter("firstName")%>"></td>
            </tr>
            <tr>
              <td>Lastname</td>
              <td><input type="text" name="lastName" value="<%=request.getParameter("lastName")%>"></td>
            </tr>
            <tr>
              <td>Date Of Birth</td>
              <td><input type="text" name="dateOfBirth" value="<%=request.getParameter("dateOfBirth")%>"></td>
            </tr>
            <tr>
              <td>Submit</td>
        			<td>
                <button type="submit" class="btn btn-success">
                  <span class="glyphicon glyphicon-ok"></span>
                </button>
              </td>
            </tr>
      		</form>
        </table>
        <br/>
        <a href="/accounts"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        <br/>
        <br/>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
