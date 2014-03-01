<%@ include file="/pages/library/PageLibs.jsp"%>

<div class="ui-widget-content ui-corner-all" style="width: 70%;">
	<div class="ui-widget-header ui-corner-top formHeading">
		<img style='vertical-align: bottom;'
			src='<%=request.getContextPath()%>/images/SEO-icon.png'
			title="Customer Reports" /> Welcome to
		<s:property value='session.get("AppCache").getAppName()' />
		<s:property value='session.get("AppCache").getVersion()' />
	</div>

	<p class="notification">
		* Improved usability experience feat. <span class="note"
			style="font-size: 1em;">(Supported Browsers: Mozilla Firefox,
			IE10, Android Tablet/Mobile Browser)</span> <br /> <span
			style="padding-left: 2em;">- New colors </span> <br /> <span
			style="padding-left: 2em;">- Better widget positioning </span>
	</p>

	<p class="notification">* H2 In-memory database is been implemented
		to improve application performance</p>

	<p class="notification">* For Administrator: Follow the document
		provided to load Excel data into application.</p>

	<p class="notification">
		* <b>Support:</b> Drop a mail to krishnarangaiah@gmail.com if you find
		any <b>Showstopper bug</b> with simulation steps and screen shots if
		possible.
	</p>

</div>
