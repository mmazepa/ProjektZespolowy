<%@page import="domain.TextFile"%>
<%@page import="domain.Account"%>
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
    <jsp:useBean id="textFile" class="domain.TextFile" scope="session" />
    <jsp:useBean id="currentTextFile" class="domain.TextFile" scope="session" />
	<jsp:useBean id="storageTextFile" class="service.TextFileManager" scope="application" />
	<jsp:useBean id="account" class="domain.Account" scope="session" />
    <jsp:useBean id="currentaccount" class="domain.Account" scope="session" />
	<jsp:useBean id="storageAccount" class="service.AccountManager" scope="application" />
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
          <form action="/doEditSnapshot" style="margin-left:0.1in" method="post">
          	<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
            <tr>
              <td>Author</td>
            <td>
            <%
			try
			{
				%>
				<select name="author" id="choose1" value="<%=Integer.parseInt(request.getParameter("author"))%>">
				<%
				for (Account i : storageAccount.getAllAccounts())
     			{
					if (Integer.parseInt(request.getParameter("author")) == i.getID()) {
						%>
	          			<option value="<%=i.getID()%>" selected><%=i.getLastName()%></option>
						<%
					} else {
						%>
	          			<option value="<%=i.getID()%>"><%=i.getLastName()%></option>
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
              <td>File</td>
            <td>
            <%
			try
			{
				%>
				<select name="file" id="choose2" value="<%=Integer.parseInt(request.getParameter("file"))%>">
				<%
				for (TextFile i : storageTextFile.getAllTextFiles())
     			{
					if (Integer.parseInt(request.getParameter("file")) == i.getID()) {
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
              <td>Name</td>
              <td><input type="text" name="name" value="<%=request.getParameter("name")%>"></td>
            </tr>
                        <tr>
              <td>Content</td>
              <td><input type="text" name="content" value="<%=request.getParameter("content")%>"></td>
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
        <a href="/snapshots"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        <br/>
        <br/>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
