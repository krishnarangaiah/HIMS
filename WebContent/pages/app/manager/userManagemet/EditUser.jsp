<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Edit User
	</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="<%=request.getContextPath()%>/ProcessEditUser" method="post"
			onsubmit="return validateSubmit()">

			<input type="hidden" name="updatedBy"
				value=<s:property
					value='session.get("SESSION_USER").getAptbUserId()' /> />
			
			<input type="hidden" name="aptbUserId"
				value=<s:property value="aptbUserId"/> />


			<table class="formTable">

				<tr>
					<td class="tdLeft"><label>Full Name</label></td>
					<td><input id="fullNameId"
						value='<s:property value="fullName"/>' type="text"
						name="fullName" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>User Name</label></td>
					<td><input id="userNameId" value='<s:property value="userName"/>' type="text" name="userName" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Password</label></td>
					<td><input id="userPasswordId" value='<s:property value="userPassword"/>' type="text" name="userPassword" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Mobile Number</label></td>
					<td><input id="mobileNoId" value='<s:property value="mobileNo"/>' type="text" name="mobileNo" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>EmailId</label></td>
					<td><input id="emailIdId" value='<s:property value="emailId"/>' type="text" name="emailId" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Micro Mngmt</label></td>
					<td><input id="microMngmtId" value='<s:property value="microMngmt"/>' type="text" name="microMngmt" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Feedback Required</label></td>
					<td><input id="feedbackReqId" value='<s:property value="feedbackReq"/>' type="text" name="feedbackReq" /></td>
				</tr>
				
				<tr>
					<td class="tdLeft"><label>Active Status</label></td>
					<td><input id="actStsId" value='<s:property value="actSts"/>' type="text" name="actSts" /></td>
				</tr>
				
				<tr>
					<td class="tdLeft"><label>Role</label></td>
					<td><s:select id="aptbRoleId" name="aptbRoleId"
							list="aptbRoles" headerKey="-1" headerValue="Select Report"
							listKey="aptbRoleId" listValue="diplayName"></s:select></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Submit" /></td>
				</tr>

			</table>

		</s:form>

	</div>
</div>
