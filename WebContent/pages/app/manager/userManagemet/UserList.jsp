<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	
</script>



<div style="width: 75%;">
	<div class="ui-widget-header ui-corner-top gridHeading">
		<img style='vertical-align: bottom;'
			src='<%=request.getContextPath()%>/images/User-Group-icon.png'
			title="User List" /> User List
	</div>

	<display:table id="aptbUsersId" name="aptbUsers"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="UserList">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("aptbUsersId_rowNum")%>'
			title="S.No" sortable="true" />
		<display:column property="userName" title="User Name" sortable="true" />
		<display:column property="fullName" title="Full Name" />
		<display:column property="emailId" title="Email ID" />
		<display:column title="Micro Mngmt">
			<s:if test='#attr.aptbUsersId.microMngmt.equals("Y")'>
				Active
			</s:if>
			<s:else>
			In-Active
			</s:else>
		</display:column>
		<display:column title="Feedback Required">
			<s:if test='#attr.aptbUsersId.feedbackReq.equals("Y")'>
				Active
			</s:if>
			<s:else>
			In-Active
			</s:else>
		</display:column>
		<display:column property="aptbRole.diplayName" title="Role" />

		<display:column title="Status">
			<s:if test='#attr.aptbUsersId.actSts.equals("Y")'>
				Active
			</s:if>
			<s:else>
			In-Active
			</s:else>
		</display:column>

		<display:column title="Actions">
			<a
				href="<%=request.getContextPath()%>/EditUser?aptbUserId=<s:property value='#attr.aptbUsersId.aptbUserId'/>">view/edit</a>
				|		
		    <a
				href="<%=request.getContextPath()%>/DeleteUser?aptbUserId=<s:property value='#attr.aptbUsersId.aptbUserId'/>"
				onclick="return confirm('Are you sure you want to delete?');">delete</a>
		</display:column>

		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     No User information found</td></tr></table>' />
		<display:setProperty name="paging.banner.item_name"
			value='User Information' />
		<display:setProperty name="paging.banner.items_name"
			value='Users Information' />
	</display:table>


</div>