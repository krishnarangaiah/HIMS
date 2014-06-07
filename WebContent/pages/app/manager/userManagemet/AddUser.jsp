<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Add User
	</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="ProcessAddUser" method="post"
			onsubmit="return validateSubmit()">

			<input type="hidden" name="createdBy"
				value=<s:property
					value='session.get("SESSION_USER").getAptbUserId()' /> />

			<table class="formTable">

				<tr>
					<td class="tdLeft"><label>Full Name</label></td>
					<td><input id="fullNameId" type="text" name="fullName" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>User Name</label></td>
					<td><input id="userNameId" type="text" name="userName" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Password</label></td>
					<td><input id="userPasswordId" type="text" name="userPassword" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Mobile Number</label></td>
					<td><input id="mobileNoId" type="text" name="mobileNo" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>EmailId</label></td>
					<td><input id="emailIdId" type="text" name="emailId" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Micro Mngmt</label></td>
					<td><input id="microMngmtId" type="text" name="microMngmt" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Feedback Required</label></td>
					<td><input id="feedbackReqId" type="text" name="feedbackReq" /></td>
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
