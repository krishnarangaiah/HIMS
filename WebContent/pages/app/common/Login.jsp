<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	function validateInput() {
		if (document.getElementById("userNameId").value === '') {
			alert("User Name is required");
			return false;
		}

		if (document.getElementById("userPasswordId").value === '') {
			alert("Password is required");
			return false;
		}
		return true;
	};
</script>


<div class="ui-widget-content ui-corner-all form_small"
	style="margin-top: 7em;">
	<div class="ui-widget-header ui-corner-top formHeading">
		<img style='vertical-align: bottom;'
			src='<%=request.getContextPath()%>/images/login-icon.png'
			title="Login" /> Login
	</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="/ProcessLogin"
			method="POST" onsubmit='return validateInput()'>
			<table class="formTable">

				<tr>
					<td class="tdLeft"><label>User Name</label></td>
					<td><input id="userNameId" name="userName" type="text" /></td>
				</tr>
				<tr>
					<td class="tdLeft"><label>Password</label></td>
					<td><input id="userPasswordId" name="userPassword"
						type="password" /></td>
				</tr>
				<tr>
					<td colspan="2" class="submitTd" align="center"><input
						type="submit" value="Login" /></td>
				</tr>

			</table>
		</s:form>
	</div>
</div>
