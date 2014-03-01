<%@ include file="/pages/library/PageLibs.jsp"%>


<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Step 2:
		Generate Statistics</div>
	<div style="margin: 1em; width: 100%;">
		<p class="notification">Please follow below Steps to Generate
			Statistics</p>
		<p class="notification">
			1. Make sure that all the records from Excel-sheet has been properly
			loaded into Database <br />(Table Name: APTB_ISTOCK_DATA)
		</p>
		<p class="notification">
			2. Now click on the below Link to generate Statistics on Provided
			Excel Sheet and for the date range provided <br /> (You can see date
			range in session bar)
		</p>

		<p style="text-align: center;">
			<a href="generateStatistics"
				style="border: 1px solid red; padding: 0.4em; background-color: yellow;">
				Generate Statistics </a>
		</p>
	</div>
</div>
