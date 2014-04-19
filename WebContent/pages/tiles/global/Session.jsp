<%@ include file="/pages/library/PageLibs.jsp"%>
<sx:head debug="true" cache="false" compressed="false" />

<div class="sessionMenu">


	<sx:div  href="ServerTime" updateFreq="1000">Server Time Zone</sx:div>

	<span class="sessionDivider"> <span class="note"
		style="color: #FFCC99;">Supported Browsers: Mozilla Firefox,
			IE10, Chrome, Android Tablet/Mobile Browser</span> <b>|</b> <s:if
			test="%{session.get('SESSION_USER')!=null}">
			
			Welcome <strong><s:property
					value='session.get("SESSION_USER").getFullName()' /></strong>
			<%-- 			<b>|</b><s:property --%>
			<%-- 					value='session.get("SESSION_USER").getAptbUserId()' /></strong> --%>
			<b>|</b>
			Role <strong><s:property
					value='session.get("SESSION_USER").getAptbRole().getDiplayName()' /></strong>
			<b>|</b>
			<a href="Logout">Logout</a>

		</s:if> <s:else>
			<a href="#"
				onclick="javascript: alert('Contact Admin to reset your password')">Forgot
				Password</a>
			<b>|</b>
			<a href="Login">Login</a>
		</s:else></span>

</div>

