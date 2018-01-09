<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../../static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <main id="indexMain">
      <div class="centeredText">
        <h3>User Panel Edit</h3>
        <hr/>
        <h4>Edit workgroup</h4>
        <br/>
        <table class="adminTable workgroupTable">
          <tr>
            <th>Input</th>
            <th>Type</th>
          </tr>
          <form action="/doEditWorkgroupByUser" style="margin-left:0.1in" method="post">
          	<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />

            <tr>
              <td>Name</td>
              <td><input type="text" name="name" value="<%=request.getParameter("name")%>"></td>
            </tr>

            <tr>
              <td>Description</td>
              <td><input type="text" name="description" value="<%=request.getParameter("description")%>"></td>
            </tr>
            <tr>
              <td>Private</td>
              <td>
                <select name="priv">
                  <option><%=Boolean.parseBoolean(request.getParameter("private"))%></option>
                  <option><%=!Boolean.parseBoolean(request.getParameter("private"))%></option>
                </select>
              </td>
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
        <a href="/subpages/userWorkgroups.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        <br/>
        <br/>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
