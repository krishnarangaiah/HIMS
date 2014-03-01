<%@ include file="/pages/library/PageLibs.jsp"%>


<script type="text/javascript">
	function validateInput() {
		alert("tktbProductId " + document.getElementById("tktbProductId").value
				+ " | tktbEnvironmentId"
				+ document.getElementById("tktbEnvironmentId").value);
		return true;
	};
</script>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">New
		Ticket</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="ProcessNewTicket" method="post">

			<table class="formTable">

				<tr>
					<td><label>Product</label></td>
					<td><s:select id="tktbProductId" name="tktbProductId"
							list='session.get("TKTB_PRODUCTS")' headerKey="-1"
							headerValue="Select Product" listKey="tktbProductId"
							listValue="product">
						</s:select></td>
				</tr>

				<tr>
					<td><label>Environment</label></td>
					<td><s:select id="tktbEnvironmentId" name="tktbEnvironmentId"
							list="tktbEnvironments" headerKey="-1"
							headerValue="Select Environment" listKey="tktbEnvironmentId"
							listValue="environment">
						</s:select></td>
				</tr>

				<tr>
					<td><label>Ticket Category</label></td>
					<td><s:select id="tktbCategoryId" name="tktbCategoryId"
							list="tktbCategories" headerKey="-1"
							headerValue="Select Category" listKey="tktbCategoryId"
							listValue="category">
						</s:select></td>
				</tr>

				<tr>
					<td><label>Severity</label></td>
					<td><select id="tktbSeverityId" name="tktbSeverityId"><option>Low</option>
							<option>Medium</option>
							<option>High</option>
							<option>Business Loss</option>
					</select></td>
				</tr>

				<tr>
					<td><label>Subject</label></td>
					<td><textarea id="subjectId" name="subject" rows="3" cols="50"></textarea></td>
				</tr>
				<tr>
					<td><label>Description</label></td>
					<td><textarea id="discId" name="disc" rows="6" cols="50"></textarea></td>
				</tr>
				<tr>
					<td><label>Simulation Steps</label></td>
					<td><textarea id="simulationStepsId" name="simulationSteps"
							rows="10" cols="50"></textarea></td>
				</tr>

				<tr>
					<td><label>Occurrence</label></td>
					<td class="note"><input type="radio" name="issueType"
						value="Frequent">Frequent <input type="radio"
						name="issueType" value="Long Run">Long Run <input
						type="radio" name="issueType" value="Random">Random</td>
				</tr>
				<tr>
					<td><label>Assign to</label></td>
					<td><s:select name="aptbUserId" list="aptbUsers"
							headerKey="-1" headerValue="Select User" listKey="aptbUserId"
							listValue="nameAndRole">
						</s:select></td>
				</tr>


				<tr>
					<td><label>ETA</label></td>
					<td><input name="eta" type="text" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Submit" onclick="return validateInput()" /></td>
				</tr>

			</table>

		</s:form>

	</div>
</div>
