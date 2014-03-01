<%@ include file="/pages/library/PageLibs.jsp"%>

<s:if test="subCategories != null">
	<s:select id="sutbSubCategoryId" name="sutbSubCategoryId"
		list="subCategories" headerKey="-1" headerValue="Select SubCategory"
		listKey="sutbSubCategoryId" listValue="subCategory"></s:select>
</s:if>
<s:else>Error: List not populated</s:else>
