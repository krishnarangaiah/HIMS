<%@ include file="/pages/library/PageLibs.jsp"%>

<div style="width: 70%; margin-top: 2em;">

	<div class="ui-widget-header ui-corner-top gridHeading ">Today 's
		Update List</div>

	<display:table id="sutbScrumUpdatesId" name="sutbScrumUpdates"
		class="dataTable ui-widget ui-corner-bottom " pagesize="100"
		requestURI="TodayScrumUpdate">
		<display:column style="width: 5%;"
			value='<%=pageContext.getAttribute("sutbScrumUpdatesId_rowNum")%>'
			title="S.No " sortable="true" />
		<display:column property="createdOn" title="createdOn" />
		<display:column property="sutbCategory.category" title="category" />
		<display:column property="sutbSubCategory.subCategory"
			title="subCategory" />
		<display:column property="aptbUser.fullName" title="subCategory" />
		<display:column property="updateTxt" title="updateTxt" />
		<display:column property="hoursSpent" title="Hours Spent" />
		<display:setProperty name="basic.msg.empty_list"
			value='<table class ="dataTable ui-corner-bottom "> <tr> <td style="padding: 1em; font-size: 1.5em ;" class ="errorMsg">No Updates found</td> </tr> </table>' />
	</display:table>

</div>