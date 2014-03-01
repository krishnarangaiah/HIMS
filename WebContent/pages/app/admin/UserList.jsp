<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	function validateUserForDeactivate(sessionUserId, recordUserId){
		if(sessionUserId == recordUserId){
			alert('You cannot Activate/Deactivate yourself');
			return false;
		}else{
			return true;	
		}		
	}
	
	function validateUserForDelete(sessionUserId, recordUserId){
		if(sessionUserId == recordUserId){
			alert('You cannot delete yourself');
			return false;
		}else{
			return true;
		}
	}
	
</script>


<div style="width: 75%;">
	<div class="ui-widget-header ui-corner-top gridHeading"> <img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/User-Group-icon.png' title="User List"/> User List | <a href="UserRegister" style="color: yellow;"> [ Add New User ]</a></div>

	<display:table id="umtbUserListID" name="umtbUserList"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="userList">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("umtbUserListID_rowNum")%>'
			title="S.No" sortable="true" />
		<display:column property="userName" title="User Name" sortable="true" />
		<display:column property="fullName" title="Full Name" />
		<display:column property="emailId" title="Email ID" />
		<display:column property="empId" title="Emp Id" />
		<display:column title="Role">
			<s:if test='#attr.umtbUserListID.isAdmin.equals("Y")'>
				Administrator
			</s:if>
			<s:else>
			User
			</s:else>
		</display:column>
		<display:column title="Status">
			<s:if test='#attr.umtbUserListID.actSts.equals("Y")'>
				Active
			</s:if>
			<s:else>
			In-Active
			</s:else>
		</display:column>
		<display:column title="Actions">
			<a
				href='activateUser?umtbUserId=<s:property value="#attr.umtbUserListID.umtbUserId"/>'
				onClick="alert('Are you sure you want to activate?'); return validateUserForDeactivate('<s:property value="session.get('SESSION_USER').getUmtbUserId()"/>' , '<s:property value="#attr.umtbUserListID.umtbUserId"/>')">
				<img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Add-icon.png' title="Activate"/>
			</a> | <a
				href='deactivateUser?umtbUserId=<s:property value="#attr.umtbUserListID.umtbUserId"/>'
				onClick="alert('Are you sure you want to deactivate?'); return validateUserForDeactivate('<s:property value="session.get('SESSION_USER').getUmtbUserId()"/>' , '<s:property value="#attr.umtbUserListID.umtbUserId"/>')">
				<img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Delete-icon.png'
				title="Deactivate" />
			</a> | <a
				href='deleteUser?umtbUserId=<s:property value="#attr.umtbUserListID.umtbUserId"/>'
				onClick="alert('Are you sure you want to delete?'); return validateUserForDelete( '<s:property value="session.get('SESSION_USER').getUmtbUserId()"/>' , '<s:property value="#attr.umtbUserListID.umtbUserId"/>')">
				<img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Close-icon.png'
				title="Delete" />
			</a>
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