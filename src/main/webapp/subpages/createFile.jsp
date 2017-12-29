<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
<%@ page import="service.WorkgroupManager"%>
<%@ page import="domain.Workgroup"%>
<%@ page import="domain.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <jsp:useBean id="currentuser" class="domain.UserInfo" scope="session" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header></header>
    <%
//       AccountManager am = new AccountManager();
//       String currentNickname = am.activeAccountNickname;
//       int currentRole = am.activeAccountRole;
//       request.setAttribute("currentNickname", currentNickname);
//       request.setAttribute("currentRole", currentRole);
    UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
    if (info != null) {
        currentuser = info;
    } else {
      //currentuser = new UserInfo();
    }

        String currentNickname = currentuser.getNickName();
        int currentId = currentuser.getUserID();
        int currentRoleId = currentuser.getRole();
        String currentRole = new String();

        RoleManager db = new RoleManager();
        List<Role> roles = new ArrayList<Role>();
        try {
          roles = db.getAllRoles();
        } catch (SQLException | NullPointerException e) {
          e.printStackTrace();
        }

        for (Role role : roles) {
          if(role.getID() == currentRoleId) {
            currentRole = role.getName();
          }
        }

        request.setAttribute("currentNickname", currentNickname);
        request.setAttribute("currentRoleId", currentRoleId);
        request.setAttribute("currentId", currentId);
    %>
    <main>
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${currentNickname != ''}">
          <h3>Create New File</h3>
          <hr/>
          <form action="/doCreateTextFile" method="post">
            <table class="adminTable textFileTable">
              <tr>
                <th>Property</th>
                <th>Value</th>
              </tr>
              <tr>
                <td>File Name</td>
                <td><input id="name" type="text" name="name"></input></td>
              </tr>
              <tr>
                <td>Group</td>
                <td>
                  <%
                  WorkgroupManager workgroupstorage = new WorkgroupManager();
                  %>
                  <select name="workgroup">
                    <%
                    for (Workgroup i : workgroupstorage.getAllWorkgroups()) {
                    %>
                      <option value="<%=i.getID()%>"><%=i.getName()%>
                    <%
                    }
                    %>
                  </select>
                </td>
              </tr>
              <tr>
                <td>Will file be private?</td>
                <td>
                  <select id="priv" name="priv">
                    <option>true</option>
                    <option>false</option>
                  </select>
                </td>
              </tr>
              <input id="author" type="hidden" name="author" value="${currentId}"></input>
              <tr>
                <td colspan="2">
                  <button type="submit" class="btn btn-success">Create File</button>
                </td>
              </tr>
            </table>
          </form>
          <br/>
          <a href="/subpages/loggedUserMainMenu.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        </c:if>

        <!-- IF USER IS NOT LOGGED IN -->
        <c:if test="${currentNickname == ''}">
          <h5 id="helloGuest">
            <strong>HELLO!</strong>
            You are not logged in. Please log in to achieve permission do use editor.
          </h5>
          <a id="backLink" href="/index.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
        </c:if>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
