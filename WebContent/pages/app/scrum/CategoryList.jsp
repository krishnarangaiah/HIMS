<%@ include file="/pages/library/PageLibs.jsp"%>

<s:if test="categories != null">
	<s:select id="sutbCategoryId" name="sutbCategoryId"
		list="categories" headerKey="-1" headerValue="Select Category"
		listKey="sutbCategoryId" listValue="category" onchange="ajaxGetSubCategoryList()"></s:select>
</s:if>
<s:else>Error: List not populated</s:else>
