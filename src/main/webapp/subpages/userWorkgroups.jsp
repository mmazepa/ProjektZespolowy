<%@ page import="domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="service.AccountManager"%>
<%@ page import="domain.Account"%>
<%@ page import="service.AttendanceManager"%>
<%@ page import="domain.Attendance"%>
<%@ page import="service.WorkgroupManager"%>
<%@ page import="domain.Workgroup"%>
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
        UserInfo info = (UserInfo) request.getSession().getAttribute("usersessioninfo");
        if (info != null) {
            currentuser = info;
        } else {
          //currentuser = new UserInfo();
        }

        int currentId = currentuser.getUserID();
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
        request.setAttribute("currentId", currentId);
    %>
    <main>
      <div class="centeredText">

        <!-- IF USER IS LOGGED IN -->
        <c:if test="${currentNickname != ''}">
          <h3>List of ${currentNickname}'s Workgroups</h3>

          <form action="/subpages/createWorkgroup.jsp" style="margin-bottom:10px;">
            <button class="btn btn-success">
              <span class="glyphicon glyphicon-plus"></span>
              New Workgroup
            </button>
          </form>

          <!-- TABLE WITH WORKGROUPS CREATED BY USER -->
          <table class="adminTable workgroupTable">
            <tr>
              <th>No.</th>
              <th>Name</th>
              <th>Creation Date</th>
              <th>Description</th>
              <th>Is Private</th>
              <th>Edit</th>
              <th>Delete</th>
              <th>Invite</th>
            </tr>

            <%
              AccountManager am = new AccountManager();
              WorkgroupManager wm = new WorkgroupManager();
              AttendanceManager atm = new AttendanceManager();


              List<Account> accounts = new ArrayList();
              List<Workgroup> workgroups = new ArrayList();
              List<Attendance> attendances = new ArrayList();

              accounts = am.getAllAccounts();
              workgroups = wm.getAllWorkgroups();
              attendances = atm.getAllAttendances();

              request.setAttribute("attendances", attendances);
              request.setAttribute("accounts", accounts);
              request.setAttribute("workgroups", workgroups);
            %>

  					<c:set var="count" value="0" />
            <c:forEach var="attendance" items="${attendances}">
              <c:if test="${attendance.getUser() == currentId and attendance.isAdmin() == true}">
            		<tr class="rowClass">
            			<td>
      							<c:set var="count" value="${count + 1}" />
      							<strong><c:out value="${count}" /></strong>
      						</td>
                    <c:forEach var="workgroup" items="${workgroups}">
                      <c:if test="${workgroup.getID() == attendance.getGroup()}">
                      <td>
                        <c:out value="${workgroup.getName()}"/>
                      </td>
                      <td>
                        <c:out value="${workgroup.getCreationDate().substring(0,19)}"/>
                      </td>
                      <td>
                        <c:out value="${workgroup.getDescription()}"/>
                      </td>
                      <td>
                    	<c:choose>
                      		<c:when test="${workgroup.isPrivate()}">
                        		<span class="glyphicon glyphicon-ok glyphiconGood"></span>
                     		</c:when>
                      		<c:otherwise>
                        		<span class="glyphicon glyphicon-remove glyphiconBad"></span>
                     		</c:otherwise>
                   		</c:choose>
                  	</td>


                  <td>
                    <form action="/subpages/userActions/obtainEditedWorkgroupDataByUser.jsp" style="display:inline">
            					<input type="hidden" name="id" value="${workgroup.getID()}">
            					<input type="hidden" name="name" value="${workgroup.getName()}">
            					<input type="hidden" name="description" value="${workgroup.getDescription()}">
      						    <input type="hidden" name="private" value="${workgroup.isPrivate()}">
            					<button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span>
            					</button>
                    </form>
                  </td>
    			  <td>
                    <form action="/subpages/userActions/removeWorkgroupByUser.jsp" style="display:inline" method="get">
      							<input type="hidden" name="id" value="${workgroup.getID()}">
            					<input type="hidden" name="name" value="${workgroup.getName()}">
            					<input type="hidden" name="creationDate" value="${workgroup.getCreationDate()}">
            					<input type="hidden" name="description" value="${workgroup.getDescription()}">
      							<input type="hidden" name="private" value="${workgroup.isPrivate()}">
                      <button type="submit" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span>
            					</button>
      						  </form>
      					  </td>
      					      			  <td>
                    <form action="/subpages/userActions/inviteUser.jsp" style="display:inline" method="get">
      							<input type="hidden" name="id" value="${workgroup.getID()}">
                      <button type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-edit"></span>
            					</button>
      						  </form>
      					  </td>
        				</tr>
        				</c:if>
                    </c:forEach>
              </c:if>
            </c:forEach>
          </table>
          <table class="adminTable workgroupTable">
            <tr>
              <th>No.</th>
              <th>Name</th>
              <th>Creation Date</th>
              <th>Description</th>
              <th>Is Private</th>
              <th>Leave</th>
            </tr>

  					<c:set var="count" value="0" />
            <c:forEach var="attendance" items="${attendances}">
              <c:if test="${attendance.getUser() == currentId and attendance.isAdmin() == false}">
            		<tr class="rowClass">
            			<td>
      							<c:set var="count" value="${count + 1}" />
      							<strong><c:out value="${count}" /></strong>
      						</td>
                    <c:forEach var="workgroup" items="${workgroups}">
                      <c:if test="${workgroup.getID() == attendance.getGroup()}">
                      <td>
                        <c:out value="${workgroup.getName()}"/>
                      </td>
                      <td>
                        <c:out value="${workgroup.getCreationDate().substring(0,19)}"/>
                      </td>
                      <td>
                        <c:out value="${workgroup.getDescription()}"/>
                      </td>
                      <td>
                    	<c:choose>
                      		<c:when test="${workgroup.isPrivate()}">
                        		<span class="glyphicon glyphicon-ok glyphiconGood"></span>
                     		</c:when>
                      		<c:otherwise>
                        		<span class="glyphicon glyphicon-remove glyphiconBad"></span>
                     		</c:otherwise>
                   		</c:choose>
                  	</td>


                  <td>
                    <form action="/subpages/userActions/leaveWorkgroupByUser.jsp" style="display:inline">
            					 <input type="hidden" name="group" value="${workgroup.getID()}">
            					 <input type="hidden" name="id" value="${currentId}">
            					<button type="submit" class="btn btn-danger">
                        <span class="glyphicon glyphicon-log-out"></span>
            					</button>
                    </form>
                  </td>
        				</tr>
        				</c:if>
                    </c:forEach>
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
