<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Status
		(Each field is Case Sensitive)</div>
	<div style="margin: 1em; width: 100%;">

		<form action="saveStatus" method="post">
			<table class="formTable">
				<tr>
					<td><label>Status</label></td>
					<td><input type="text" name="status" /></td>
				</tr>
				<tr>
					<td><label>Pending With</label></td>
					<td><select name="pendingWith">
							<option value="OFSS">OFSS</option>
							<option value="Site">Site</option>
							<option value="Others">Others</option>
					</select></td>
				</tr>
				<tr>
					<td><label>Classification</label></td>
					<td>
					<input type="radio" name="classification" value="Open" checked="checked"><label>Open</label> <input type="radio" name="classification" value="Concluded" ><label>Concluded</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>
