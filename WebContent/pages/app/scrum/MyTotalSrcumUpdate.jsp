<%@ include file="/pages/library/PageLibs.jsp"%>



<div style="width: 70%; margin-top: 2em;">
	<div class="ui-widget-header ui-corner-top gridHeading">My Scrum
		History (This month)</div>

	<display:table id="sutbScrumUpdatesId" name="sutbScrumUpdates"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="TodayScrumUpdate">public String getDisplayName() {
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("sutbScrumUpdatesId_rowNum")%>'
			title="S.No" sortable="true" />

		<display:column property="createdOn" title="Scrum Data" />
		<display:column property="sutbReportDetail.displayName"
			title="Update belongs to Report" />
		<display:column property="sutbCategory.category" title="Category" />
		<display:column property="sutbSubCategory.subCategory"
			title="Sub Category" />
		<display:column property="updateTxt" title="Update Txt" />
		<display:column property="hoursSpent" title="Hours Spent" />

		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     You have no scrum updates for this month</td></tr></table>' />
	</display:table>

</div>

