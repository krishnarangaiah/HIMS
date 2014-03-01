package framework.core.setup.app.action.extentions;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import app.core.components.AppCache;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import framework.core.setup.app.action.vocabilary.ActionVocabilary;

public class ActionExtension extends ActionSupport implements ActionVocabilary, SessionAware {

	private static final long serialVersionUID = 1L;

	/* Session variables */
	private Map<String, Object> session = ActionContext.getContext().getSession();
	
	/* Action variables */
	private String actionMessage, errorMessage;
	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	public static final AppCache appCache = new AppCache(); 
		
	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}

}
