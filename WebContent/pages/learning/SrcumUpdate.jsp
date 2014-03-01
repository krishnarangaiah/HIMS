<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Today's
		Scrum Update</div>
	<div style="margin: 1em; width: 100%;">


		<sx:bind id="binder" href="GetCategoryList" sources="b1"
			events="onchange" targets="div1" />

		<sx:bind sources="sutbReportDetailId"
			formId="cambiar_proyecto_actual_form" targets="div1"
			events="onchange" />

		<s:select id="b1" list="{'krishna','Kadapannagari'}">
		</s:select>

		<div id="navegacion_proyectos">
			<s:form id="cambiar_proyecto_actual_form" action="ServerTime">
				<s:if test="sutbReportDetails != null">
					<s:select id="sutbReportDetailId" name="sutbReportDetailId"
						list="sutbReportDetails" headerKey="-1"
						headerValue="Select Report" listKey="sutbReportDetailId"
						listValue="displayName"></s:select>
				</s:if>
			</s:form>

		</div>


		<div id="div1"></div>




	</div>
</div>