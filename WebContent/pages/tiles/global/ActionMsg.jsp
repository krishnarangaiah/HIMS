<%@ include file="/pages/library/PageLibs.jsp"%>


<s:if test='%{errorMessage != null && !errorMessage.equals("")}'>
	<div id="errorMsgId" class="ui-state-error ui-corner-all errorMsg">
		<s:property value="errorMessage" />
	</div>
</s:if>
<s:elseif test='%{actionMessage != null && !actionMessage.equals("")}'>
	<div id="actionMsgId" class="ui-state-highlight ui-corner-all actionMsg">
		<s:property value="actionMessage" />
	</div>
</s:elseif>


<script type="text/javascript">
$('#actionMsgId').delay(7000).fadeOut(1000);
$('#errorMsgId').delay(30000).fadeOut(1000);
</script>