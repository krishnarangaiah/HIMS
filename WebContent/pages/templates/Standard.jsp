<%@ include file="/pages/library/TemplateLibs.jsp"%>
<%@ include file="/pages/library/PageLibs.jsp"%>

<html>
<head>

<title><s:property value='session.get("AppCache").getAppName()' /> Bug Tracker - <tiles:insertAttribute name="pageTitleText" /></title>

<script>

</script>

<style type="text/css">
.ui-menu {
	width: 150px;
}
</style>

</head>
<body>

	<table style="height: 100%; width: 100%;" class="">
		<tr style="height: 5%;" class="ui-widget-header">
			<td><table style="height: 100%; width: 100%;">
					<tr>
						<td class="headerTD"><tiles:insertAttribute name="pageHeader" />
						</td>
						<td class="sessionTD"><tiles:insertAttribute
								name="headerSession" /></td>
					</tr>
				</table></td>
		</tr>

		<tr style="height: 2.5em;">
			<td colspan="2" align="center"><tiles:insertAttribute
					name="actionMsg" /></td>
		</tr>

		<tr style="height: 90%;">
			<td>
				<table style="width: 100%; height: 100%;">
					<tr>
						<td class="menu"><tiles:insertAttribute name="menu" /></td>
						<td class="appBody" align="center"><tiles:insertAttribute name="body" /></td>
					</tr>
				</table>
			</td>

		</tr>

	</table>


</body>
</html>