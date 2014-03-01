<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="demos-nav" style="text-align: left; position: fixed;">
	<!-- 
	<h4>Tickets</h4>
	<ul>
		<li><a href="NewTicket"> New</a></li>
		<li><a href="#" onclick="underConstruction()"> View All</a></li>
		<li><a href="#" onclick="underConstruction()"> Search</a></li>
	</ul>

	<h4>My Account</h4>
	<ul>
		<li><a href="#" onclick="underConstruction()">Statistics</a></li>
		<li><a href="#" onclick="underConstruction()">Raised by me</a></li>
		<li><a href="#" onclick="underConstruction()">Assigned to me</a></li>
	</ul>

	<h4>Statistics</h4>
	<ul>
		<s:if test="%{session.get(\"SESSION_USER\")!=null}">
			<s:iterator value='session.get("TKTB_PRODUCTS")'>
				<li><a href="#" onclick="underConstruction()"><s:property
							value="product" /></a></li>
			</s:iterator>
		</s:if>
	</ul>
-->
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
	%>

	<h4>My Account</h4>
	<ul>
		<li><a href="#">Info</a></li>
		<li><a href="#">Statistics</a></li>
	</ul>

	<h4>Scrum Update</h4>
	<ul>
		<li><a href="TodayScrumUpdate">My Update (<%=sdf.format(date)%>)
		</a></li>
		<li><a href="FinalScrumReport">Final Scrum Report</a></li>
		<li><a href="TotalScrumUpdate">My Scrum History</a></li>
	</ul>

	<s:if
		test="%{session.get('SESSION_USER').getAptbRole().getUserMemt().equals(\"Y\")}">
		<h4>User Management</h4>
		<ul>
			<li><a href="UserList">User List</a></li>
			<li><a href="UserAdd">Add New User</a></li>
		</ul>

	</s:if>
</div>