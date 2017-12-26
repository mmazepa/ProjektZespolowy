<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="service.AccountManager"%>
<%@ page import="service.RoleManager"%>
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
    <!-- SCRIPT FOR PAGINATION -->
    <script src="../static/javascript/pagination.js"></script>
	</head>
	<body onload="loadHeaderAndFooter(); loadRows();">
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
    %>
    <main id="indexMain">
      <div class="centeredText">


        <!-- IF USER IS LOGGED IN AND IS ADMIN -->
        <c:if test="${(currentNickname != '') and (currentRoleId == 1)}">
          <h3>Administrator Panel</h3>
          <hr/>
          <h4>List of registered users</h4>
          <br/>
          <table class="adminTable accountTable">
            <tr>
              <th>No.</th>
              <th>Role</th>
              <th>Nickname</th>
              <th>E-mail</th>
              <%-- <th>Password</th> --%>
              <th>Registration Date</th>
              <th>Description</th>
              <th>Firstname</th>
              <th>Lastname</th>
              <th>Date Of Birth</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>

						<%-- <%
							int pageNumber = 1;
							int modulo = 5;
							request.setAttribute("pageNumber", pageNumber);
							request.setAttribute("modulo", modulo);
						%>

						<c:set var="pageNumber" value="1"></c:set>
						<c:set var="modulo" value="5"></c:set> --%>

            <c:forEach var="account" items="${accounts}" varStatus="loop">
							<%-- <c:if test="${loop.index < modulo*pageNumber }"> --%>
							<c:if test="${true}">
	        			<tr class="rowClass">
	        				<td>
	                  <%-- <c:out value="${account.getID()}"/> --%>
										<%-- <strong>${(pageNumber*(loop.index))%modulo + 1}</strong> --%>
										<strong>${loop.index+1}</strong>
	                </td>
	                <td>
	                  <%-- <c:out value="${account.getRole()}"/> --%>
	                  <c:choose>
	                    <c:when test="${account.getRole() == '1'}">
	                      <span id="admin">Administrator</span>
	                    </c:when>
	                    <c:when test="${account.getRole() == '2'}">
	                      <span id="mod">Moderator</span>
	                    </c:when>
	                    <c:when test="${account.getRole() == '3'}">
	                      <span id="user">User</span>
	                    </c:when>
	                  </c:choose>
	                </td>
	        				<td><c:out value="${account.getNickname()}"/></td>
	                <td>
	                  <a href="mailto:${account.getEmail()}">
	                    <c:out value="${account.getEmail()}"/>
	                  </a>
	                </td>
	                <%-- <td><c:out value="${account.getPass()}"/></td> --%>
	                <%-- <td>**********</td> --%>
	                <td>
	                  <abbr title="${account.getRegistrationdate().substring(0,16)}">
	                    <c:out value="${account.getRegistrationdate().substring(0,10)}"/>
	                  </abbr>
	                </td>
	                <td><c:out value="${account.getDescription()}"/></td>
	                <td><c:out value="${account.getFirstName()}"/></td>
	                <td><c:out value="${account.getLastName()}"/></td>
	                <td><c:out value="${account.getDateOfBirth().substring(0,10)}"/></td>
	                <td>
	                  <form action="/subpages/obtainEditedAccountData.jsp" style="display:inline">
	        						<input type="hidden" name="id" value="${account.getID()}">
	        						<input type="hidden" name="role" value="${account.getRole()}">
	        						<input type="hidden" name="nickname" value="${account.getNickname()}">
	        						<input type="hidden" name="email" value="${account.getEmail()}">
	        						<input type="hidden" name="registrationdate" value="${account.getRegistrationdate()}">
	        						<input type="hidden" name="description" value="${account.getDescription()}">
	        						<input type="hidden" name="firstName" value="${account.getFirstName()}">
	        						<input type="hidden" name="lastName" value="${account.getLastName()}">
	        						<input type="hidden" name="dateOfBirth" value="${account.getDateOfBirth()}">
	        						<button type="submit" class="btn btn-primary">
	                      <span class="glyphicon glyphicon-pencil"></span>
	        						</button>
	                  </form>
	                </td>
	    			  		<td>
	                  <form action="/subpages/removeAccount.jsp" style="display:inline" method="get">
	        						<input type="hidden" name="id" value="${account.getID()}">
	        						<input type="hidden" name="nickname" value="${account.getNickname()}">
	        						<input type="hidden" name="email" value="${account.getEmail()}">
	        						<input type="hidden" name="firstName" value="${account.getFirstName()}">
	        						<input type="hidden" name="lastName" value="${account.getLastName()}">
	                    <button type="submit" class="btn btn-danger">
	                      <span class="glyphicon glyphicon-remove"></span>
	        						</button>
	  						    </form>
	  					    </td>
	  				    </tr>
							</c:if>
            </c:forEach>
          </table>
					<br/>

					<!-- PAGINATION MENU -->
          <!-- PREVIOUS PAGE BUTTON -->
					<button id="previousPage"
                  class="btn btn-success"
                  onclick="changePage('back')">
						<span class="glyphicon glyphicon-backward"></span>
					</button>
					Page
					<strong>
            <!-- CURRENT PAGE INFO -->
						<span id="currentPage">1</span>
					</strong>
					of
					<strong>
						<%-- <fmt:formatNumber	value="${(accounts.size()/modulo)+(1-((accounts.size()/modulo)%1))%1}"
															maxFractionDigits="0"/> --%>
            <!-- ALL AVAILABLE PAGES INFO -->
						<span id="allPages">...</span>
					</strong>
          <!-- NEXT PAGE BUTTON -->
    			<button id="nextPage"
                  class="btn btn-success"
                  onclick="changePage('next')">
						<span class="glyphicon glyphicon-forward"></span>
					</button>

          <br/>
          <a href="/subpages/admin.jsp"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        </c:if>

        <!-- IF USER IS LOGGED IN AND IS NOT ADMIN -->
        <c:if test="${(currentNickname != '') and (currentRoleId != 1)}">
          <h5 id="helloGuest">
            <strong>SORRY!</strong>
            You don't have permission to see this section.
          </h5>
          <a id="backLink" href="/index.jsp">
            <span class="glyphicon glyphicon-arrow-left"></span>
            Back
          </a>
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
