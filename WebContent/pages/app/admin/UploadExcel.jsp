<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	function confirmationBefore() {
		return confirm('This action will truncate earlier data, are you sure?');
	};
</script>


<div class="ui-widget-content ui-corner-all form_large">
	<div class="ui-widget-header ui-corner-top formHeading"> <img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/important-icon.png' title="Important Note"/> !! Important !!</div>

	<p class="notification">Please ensure that the i-Support Excel upload process
		qualifies below constraints</p>

	<p class="notification">1. Excel should not be modified. As in, it should not have any entry made by you.</p>
	<p class="notification">2. The columns that are in <b style="color: red;">order</b> and consideration on the time, writing this code is as follows and will expect the sheet in the same format,
		<br/>
		<span style="color: blue; font-weight: bold;">Srl No, Region, Country, Site Code, Version, Issue No, Ref. No, Customer Tracking #, Module, Criticality, Severity, Date Reported, Aging Days, Reported By, Query Description, Status, Add. To, Last Event Date, Last Event Description, SFR No, Assigned To, Error Cause</span>	
	</p>
	
	<p class="notification">3. <b>excelFilePath</b> parameter in Application.properties file is properly been set</p>

</div>

<br />
<br />

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading"> <img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/load-download-icon.png' title="Load Data"/> Step 1: Load Data</div>
	<div style="margin: 1em; width: 100%;">
		<s:form action="uploadFile" enctype="multipart/form-data"
			method="post">

			<table class="formTable">
				<tr>
					<td><label>Upload i-support Excel</label></td>
					<td><s:file name="fileUpload" /></td>
				</tr>
				<tr>
					<td><label>Start Date</label></td>
					<td><input name="reportStartDate" type="text" /></td>
				</tr>
				<tr>
					<td><label>End Date</label></td>
					<td><input name="reportEndDate" type="text" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Upload" onclick="return confirmationBefore()" /></td>
				</tr>
			</table>

		</s:form>

	</div>
</div>
