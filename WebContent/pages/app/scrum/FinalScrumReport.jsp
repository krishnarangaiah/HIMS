<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	function ajaxGetScrumUpdateList() {
		$.ajax({
			url : "GetSrcumUpdatesListByReportId",
			data : {
				sutbReportDetailId : $("#sutbReportDetailId").val()
			},
			success : function(data) {
				$("#scrumReportId").html(data);
			}
		});
	}
</script>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Select
		Report</div>
	<div style="margin: 1em; width: 100%;">

		<table class="formTable">

			<tr>
				<td class="tdLeft"><label>Report</label></td>
				<td><s:select id="sutbReportDetailId" name="sutbReportDetailId"
						list="sutbReportDetails" headerKey="-1"
						headerValue="Select Report" listKey="sutbReportDetailId"
						listValue="displayName" onchange="ajaxGetScrumUpdateList()"></s:select></td>
			</tr>


		</table>
	</div>
</div>


<div id="scrumReportId">

	<%@ include file="/pages/app/scrum/ScrumReportById.jsp"%>

</div>