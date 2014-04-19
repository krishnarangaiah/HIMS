<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Add User
	</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="ProcessWeekdaySettings" method="post"
			onsubmit="return validateSubmit()">

			<input type="hidden" name="createdBy"
				value=<s:property
					value='session.get("SESSION_USER").getAptbUserId()' /> />

			<table class="formTable">

				<thead>
					<tr>
						<th class="tdLeft" style="padding: 0.1em;">Week Day</th>
						<th align="center">Working</th>
						<th align="center">Reception</th>
					</tr>
				</thead>

				<tr>
					<td class="tdLeft"><label>Monday</label></td>
					<td align="center"><input name="monWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="monReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Tuesday</label></td>
					<td align="center"><input name="tueWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="tueReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Wednesday</label></td>
					<td align="center"><input name="wedWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="wedReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Thursday</label></td>
					<td align="center"><input name="thuWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="thuReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Friday</label></td>
					<td align="center"><input name="friWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="friReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Saturday</label></td>
					<td align="center"><input name="satWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="satReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Sunday</label></td>
					<td align="center"><input name="sunWorkingFlag"
						type="checkbox" /></td>
					<td align="center"><input name="sunReceptionFlag"
						type="checkbox" /></td>
				</tr>

				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="Submit" /></td>
				</tr>

			</table>

		</s:form>

	</div>
</div>
