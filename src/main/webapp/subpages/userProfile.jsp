<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
<%@ page import="domain.Role"%>
<%@ page import="domain.Account"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.GregorianCalendar"%>
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
        AccountManager am = new AccountManager();
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
        Account account = new Account();
				Role role = new Role();

        account = am.getAccount(currentId);
        request.setAttribute("account", account);
		    request.setAttribute("currentId", currentId);
        request.setAttribute("currentNickname", currentNickname);
        request.setAttribute("currentRole", currentRole);
    %>
    <main>
      <div class="centeredText">

        <!-- IF USER IS LOGGED ID -->
        <c:if test="${currentNickname != ''}">
          <h3>${currentNickname}'s Profile</h3>
          <hr/>
          <div id="userProfile">
            <span id="nickname">
              <span class="glyphicon glyphicon-user"></span>
              <c:out value="${account.getNickname()}"/>
            </span>
            <%-- <button id="editProfileButton"
                    class="btn btn-primary"
                    onclick="location.assign('/subpages/userActions/obtainEditedAccountDataByUser.jsp')">
              Edit Profile
            </button> --%>

            <form action="/subpages/userActions/obtainEditedAccountDataByUser.jsp">
              <input type="hidden" name="id" value="${account.getID()}">
              <input type="hidden" name="role" value="${account.getRole()}">
              <input type="hidden" name="nickname" value="${account.getNickname()}">
              <input type="hidden" name="email" value="${account.getEmail()}">
              <input type="hidden" name="registrationdate" value="${account.getRegistrationdate()}">
              <input type="hidden" name="description" value="${account.getDescription()}">
              <input type="hidden" name="firstName" value="${account.getFirstName()}">
              <input type="hidden" name="lastName" value="${account.getLastName()}">
              <input type="hidden" name="dateOfBirth" value="${account.getDateOfBirth()}">
              <button id="editProfileButton" type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-pencil"></span>
                Edit Profile
              </button>
            </form>

            <div id="aboutMe">
              <h4>About me</h4>
              <div id="aboutMeInfo">
                <table id="userProfileTable">
                  <tr>
                    <td>First Name</td>
                    <td>
                      <c:choose>
                        <c:when test="${account.getFirstName() != ''}">
                          <c:out value="${account.getFirstName()}"/>
                        </c:when>
                        <c:otherwise>
                          -
                        </c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                  <tr>
                    <td>Last Name</td>
                    <td>
                      <c:choose>
                        <c:when test="${account.getLastName() != ''}">
                          <c:out value="${account.getLastName()}"/>
                        </c:when>
                        <c:otherwise>
                          -
                        </c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                  <tr>
                    <td>Role</td>
                    <td><c:out value="${currentRole}"/></td>
                  </tr>
                  <tr>
                    <td>E-mail</td>
                    <td>
                      <a href="mailto:${account.getEmail()}">
                        <c:out value="${account.getEmail()}"/>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>Password</td>
                    <td>**********</td>
                  </tr>
                  <tr>
                    <td>Date Of Birth</td>
                    <td>
                      <%
                        GregorianCalendar cal = new GregorianCalendar();
                        int year = cal.get(GregorianCalendar.YEAR);
                        request.setAttribute("year", year);
                      %>

                      <c:out value="${account.getDateOfBirth().substring(0,10)}"/>
                      (<c:out value="${year - account.getDateOfBirth().substring(0,4)}"/> years old)
                    </td>
                  </tr>
                  <tr>
                    <td>Registration Date</td>
                    <td><c:out value="${account.getRegistrationdate().substring(0,16)}"/></td>
                  </tr>
                </table>
              </div>
              <h4>Description</h4>
              <div id="description">
                <c:choose>
                  <c:when test="${(account.getDescription() != '') and (account.getDescription() != null )}">
                    <c:out value="${account.getDescription()}"/>
                  </c:when>
                  <c:otherwise>
                    <p class="blank">No description available.<p>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>

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
