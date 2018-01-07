<%@page import="domain.Account"%>
<%@page import="domain.Workgroup"%>
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
    <jsp:useBean id="account" class="domain.Account" scope="session" />
    <jsp:useBean id="group" class="domain.Workgroup" scope="session" />
    <jsp:useBean id="currentgroup" class="domain.Workgroup" scope="session" />
    <jsp:useBean id="accountstorage" class="service.AccountManager" scope="application" />
	  <jsp:useBean id="workgroupstorage" class="service.WorkgroupManager" scope="application" />
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>Administrator Panel Edit</h3>
        <hr/>
        <h4>Edit attendance</h4>
        <br/>
        <table class="adminTable">
          <tr>
            <th>Input</th>
            <th>Type</th>
          </tr>
          <form action="/doEditAttendance" style="margin-left:0.1in" method="post">
          	<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
            <tr>
              <td>Group</td>
              <td>
              <%
        			try
        			{
        			%>
        				<select name="group" id="choose1" value="<%=Integer.parseInt(request.getParameter("group"))%>">
        				<%
        				for (Workgroup i : workgroupstorage.getAllWorkgroups())
             			{
        					if (Integer.parseInt(request.getParameter("group")) == i.getID()) {
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
              <td>User</td>
              <!-- <td><input type="text" name="user" value="<%=request.getParameter("user")%>"></td> -->
              <td>
              <%
              try
              {
              %>
                <select name="user" id="choose2" value="<%=Integer.parseInt(request.getParameter("user"))%>">
                <%
                for (Account i : accountstorage.getAllAccounts())
                  {
                  if (Integer.parseInt(request.getParameter("user")) == i.getID()) {
                    %>
                          <option value="<%=i.getID()%>" selected><%=i.getNickname()%></option>
                    <%
                  } else {
                    %>
                          <option value="<%=i.getID()%>"><%=i.getNickname()%></option>
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
              <td>Is Admin</td>
              <!-- <td><input type="text" name="isAdmin" value="<%=request.getParameter("isAdmin")%>"></td> -->
              <td>
                <select name="isAdmin">
                  <option><%=Boolean.parseBoolean(request.getParameter("isAdmin"))%></option>
                  <option><%=!Boolean.parseBoolean(request.getParameter("isAdmin"))%></option>
                </select>
              </td>
            </tr>
            <tr>
              <td>Join Date</td>
              <td><input type="text" name="joinDate" value="<%=request.getParameter("joinDate")%>"></td>
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
        <a href="/attendances"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        <br/>
        <br/>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
