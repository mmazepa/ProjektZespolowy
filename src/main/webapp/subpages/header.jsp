<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
<%@ page import="domain.Role"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="domain.UserInfo"%>

<jsp:useBean id="currentuser" class="domain.UserInfo" scope="session" />

<%
    UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
    if (info != null) {
        currentuser = info;
    } else {
      //currentuser = new UserInfo();
    }

    String currentNickname = currentuser.getNickName();
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
    request.setAttribute("currentRole", currentRole);
%>

<a id="logo" href="/index.jsp">
  <span class="glyphicon glyphicon-globe"></span>
</a>
Editor On-Line for programmatic cooperation in real-time

<!-- IF USER IS LOGGED IN -->
<c:if test="${currentNickname != ''}">
  <h5 id="helloUser">
    <table id="helloUserTable">
      <tr>
        <td>
          <strong>HELLO!</strong>
          You are logged as <strong><%= currentNickname %></strong>
          ( <%= currentRole %> )
        </td>
        <td>
          <select id="navigate" onchange="changeLocation();">
            <option disabled="disabled">-- Where do you go? --</option>
            <c:if test="${currentRole == 'Administrator'}">
              <option>Administrator Panel</option>
            </c:if>
            <option>Editor</option>
            <option>Home Page</option>
            <option>My Files</option>
            <option>My Profile</option>
            <option selected>Stay Here</option>
          </select>
        </td>
        <td>
          <form name="form" action="/subpages/loggedUserMainMenu.jsp" method="POST">
            <button id="backToMenuButton"
                    class="btn btn-danger">
              <span class="glyphicon glyphicon-th-list"></span>
              Main Menu
            </button>
          </form>
        </td>
        <td>
          <form name="form" action="/doLogout" method="POST">
            <button id="logoutButton"
                    class="btn btn-danger"
                    onclick="logout()">
              <span class="glyphicon glyphicon-log-out"></span>
              Log Out
            </button>
          </form>
        </td>
      </tr>
    </table>
  </h5>
</c:if>

<!-- IF USER IS NOT LOGGED IN -->
<c:if test="${currentNickname == ''}">
  <h5 id="helloUser">
    <strong>HELLO!</strong>
    You are anonymous guest, right?
  </h5>
</c:if>
