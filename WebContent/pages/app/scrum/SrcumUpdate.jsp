<%@ include file="/pages/library/PageLibs.jsp"%>

<script type="text/javascript">
	function ajaxGetCategoryList() {
		$.ajax({
			url : "GetCategoryList",
			data : {
				sutbReportDetailId : $("#sutbReportDetailId").val()
			},
			success : function(data) {
				$("#categoryListDiv").html(data);
			}
		});
	}

	function ajaxGetSubCategoryList() {

		$.ajax({
			url : "GetSubCategoryList",
			data : {
				sutbCategoryId : $("#sutbCategoryId").val()
			},
			success : function(data) {
				$("#subCategoryListDiv").html(data);
			}
		});
	}

	function validateSubmit() {

		if (document.getElementById("sutbReportDetailId").value === '-1') {
			alert("Report is Mandatory");
			return false;
		}

		if (document.getElementById("updateTxtId").value === '') {
			alert("Are you in consious? Update txt is required");
			return false;
		}
		return true;
	}
	
</script>

<div class="ui-widget-content ui-corner-all form_medium">
	<div class="ui-widget-header ui-corner-top formHeading">Scrum
		Update</div>
	<div style="margin: 1em; width: 100%;">

		<s:form action="ProcessScrumUpdate" method="post"
			onsubmit="return validateSubmit()">

			<input type="hidden" name="memberId"
				value=<s:property
					value='session.get("SESSION_USER").getAptbUserId()' /> />
			<table class="formTable">

				<tr>
					<td class="tdLeft"><label>Scrum Type</label></td>
					<td><s:select id="sutbReportDetailId"
							name="sutbReportDetailId" list="sutbReportDetails" headerKey="-1"
							headerValue="Select Report" listKey="sutbReportDetailId"
							listValue="displayName" onchange="ajaxGetCategoryList()"></s:select></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Category</label></td>
					<td><div id="categoryListDiv">
							<s:select list='{"Select Category"}'>
							</s:select>
						</div></td>
				</tr>

				<tr>
					<td class="tdLeft"><label>Sub Category</label></td>
					<td><div id="subCategoryListDiv">
							<s:select list='{"Select SubCategory"}'>
							</s:select>
						</div></td>
				</tr>

				<s:if
					test="%{session.get('SESSION_USER').getMicroMngmt().equals(\"Y\")}">

					<tr>
						<td class="tdLeft"><label>Hours Spent</label></td>
						<td><input id="hoursSpentId" type="text" name="hoursSpent"
							placeholder="format = hh:mm" /></td>
					</tr>

				</s:if>

				<s:if
					test="%{session.get('SESSION_USER').getFeedbackReq().equals(\"Y\")}">

					<tr>
						<td class="tdLeft"><label>Feedback Required</label></td>
						<td><s:select id="feedbackReqId" name="feedbackReq"
								list="#{'1':'Bad','2':'Ok','3':'Good','4':'Happy','5':'Awesome'}" /></td>
					</tr>

				</s:if>


				<tr>
					<td class="tdLeft"><label>Your Update</label></td>
					<td><textarea id="updateTxtId" name="updateTxt" rows="3"
							cols="50"></textarea></td>
				</tr>


				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Submit" onclick="return validateInput()" /></td>
				</tr>

			</table>

		</s:form>


	</div>
</div>


<div style="width: 70%; margin-top: 2em;">
	<div class="ui-widget-header ui-corner-top gridHeading">My
		Updates for Today</div>

	<display:table id="sutbScrumUpdatesId" name="sutbScrumUpdates"
		class="dataTable ui-widget ui-corner-bottom" pagesize="100"
		requestURI="TodayScrumUpdate">
		<display:column style="width:5%;"
			value='<%=pageContext.getAttribute("sutbScrumUpdatesId_rowNum")%>'
			title="S.No" sortable="true" />

		<display:column property="sutbReportDetail.displayName" title="Report" />
		<display:column property="sutbCategory.category" title="Category" />
		<display:column property="sutbSubCategory.subCategory"
			title="Sub Category" />
		<display:column property="updateTxt" title="Update Txt" />
		<display:column property="hoursSpent" title="Hours Spent" />
		<display:column title="Actions">
			<a
				href='DeleteScrumUpdate?sutbScrumUpdateId=<s:property value="#attr.sutbScrumUpdatesId.sutbScrumUpdateId"/>'
				onClick="alert('Are you sure you want to delete?'); return validateUserForDelete( '<s:property value="session.get('SESSION_USER').getUmtbUserId()"/>' , '<s:property value="#attr.umtbUserListID.umtbUserId"/>')">
				<img style='vertical-align: bottom;'
				src='<%=request.getContextPath()%>/images/Button-Close-icon1.png'
				title="Delete" />
			</a>
		</display:column>


		<display:setProperty name="basic.msg.empty_list"
			value='<table class="dataTable ui-corner-bottom"><tr><td style="padding:1em; font-size:1.5em;" class="errorMsg">
                                     No Updates found</td></tr></table>' />
	</display:table>

</div>

