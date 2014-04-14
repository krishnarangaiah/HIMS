package framework.core.custom.interceptors;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import app.core.components.AppCache;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import framework.core.custom.log4j.logger.levels.AppLevel;
import framework.core.setup.app.action.vocabilary.ActionVocabilary;

public class CheckSession implements Interceptor, ActionVocabilary,
		SessionAware {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(CheckSession.class);
	private Map<String, Object> session = ActionContext.getContext()
			.getSession();

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		String returnValue;

		long actionStartTime = System.currentTimeMillis();
		LOGGER.log(AppLevel.APP_INFO, "Session Object is: "
				+ invocation.getInvocationContext().getSession());
		invocation.getInvocationContext().getSession()
				.put("AppCache", AppCache.getInstance());

		LOGGER.log(
				AppLevel.APP_DEBUG,
				"User LoggedIn : "
						+ invocation.getInvocationContext().getSession()
								.get("SESSION_USER"));

		if (invocation.getInvocationContext().getSession()
				.containsKey("SESSION_USER")) {
			returnValue = invocation.invoke();
		} else {
			returnValue = APP_LOGIN;
		}

		LOGGER.log(AppLevel.APP_DEBUG,
				"Action performed in "
						+ (System.currentTimeMillis() - actionStartTime)
						+ " Milliseconds");

		return returnValue;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
