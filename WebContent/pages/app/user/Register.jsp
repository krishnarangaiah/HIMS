<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading"> <img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/register-icon.png' title="Register User"/> Register</div>
	<div style="margin: 1em; width: 100%;">
		
		<form action="RegisterUser" method="post">
		<table class="formTable">
			<tr><td><label>User Name</label></td><td><input type="text" name="userName" /></td></tr>
			<tr><td><label>Password</label></td><td><input type="password" name="userPassword" /></td></tr>
			<tr><td><label>Full Name</label></td><td><input type="text" name="fullName"/></td></tr>
			<tr><td><label>Email ID</label></td><td><input type="text" name="emailId"/></td></tr>
			<tr><td><label>Mobile</label></td><td><input type="text" name="mobile" /></td></tr>
			<tr><td><label>Employee ID</label></td><td><input type="text" name="employeeId"/></td></tr>
			<tr><td><label>Is Administrator</label></td><td><input type="radio" name="isAdmin" value="Y"><label>Yes</label> <input type="radio" name="isAdmin" value="N" checked="checked"><label>No</label></td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="Register" /></td></tr>
		</table>
		</form>
	</div>
</div>
