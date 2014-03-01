<%@ include file="/pages/library/PageLibs.jsp"%>

<div style="width: 50%;">
	<div class="ui-widget-header ui-corner-top gridHeading">Criticality
		List | <a href="addCriticality" style="color: yellow;"> [ Add New Criticality ]</a></div>

	<display:table id="aptbCriticalityListID" name="criticalityList"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="staticMantenance">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("aptbCriticalityListID_rowNum")%>'
			title="S.No" sortable="true" />
		<display:column property="criticality" title="Criticality"
			sortable="true" />

		<display:column title="Actions">
			<a
				href='deleteCriticality?aptbCriticalityId=<s:property value="#attr.aptbCriticalityListID.aptbCriticalityId"/>'
				onClick="alert('Are you sure you want to delete?');"> <img
				style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Close-icon.png'
				title="Delete" />
			</a>
		</display:column>



		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     No Criticality information found</td></tr></table>' />
	</display:table>


</div>

<br />
<br />

<div style="width: 50%;">
	<div class="ui-widget-header ui-corner-top gridHeading">Status
		List | <a href="addStatus" style="color: yellow;"> [ Add New Status ]</a> </div>

	<display:table id="aptbStatusListID" name="statusList"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="staticMantenance">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("aptbStatusListID_rowNum")%>'
			title="S.No" sortable="true" />
		<display:column property="status" title="Status" sortable="true" />
		<display:column property="pendingWith" title="pindingWith" />
		<display:column property="classification" title="classification" />

		<display:column title="Actions">
			<a
				href='deleteStatus?aptbStatusId=<s:property value="#attr.aptbStatusListID.aptbStatusId"/>'
				onClick="alert('Are you sure you want to delete?');"> <img
				style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Close-icon.png'
				title="Delete" />
			</a>
		</display:column>

		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     No Criticality information found</td></tr></table>' />
	</display:table>


</div>

<br />
<br />

<div style="width: 50%;">
	<div class="ui-widget-header ui-corner-top gridHeading">Age Slab
		List</div>

	<display:table id="ageSlabListID" name="ageSlabList"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="staticMantenance">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("ageSlabListID_rowNum")%>'
			title="S.No" sortable="true" />
		<display:column property="ageSlab" title="ageSlab" sortable="true" />
		<display:column property="dayLimitStart" title="dayLimitStart" />
		<display:column property="dayLimitEnd" title="dayLimitEnd" />
		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     No Criticality information found</td></tr></table>' />
	</display:table>


</div>

