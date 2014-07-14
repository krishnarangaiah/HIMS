package framework.core.setup.app.action.extentions

import org.apache.struts2.ServletActionContext
import org.springframework.web.context.support.WebApplicationContextUtils
import com.opensymphony.xwork2.ActionContext
import java.util.HashMap
import framework.core.setup.app.action.vocabilary.ActionVocabilary
import com.opensymphony.xwork2.ActionSupport
import org.apache.struts2.interceptor.SessionAware
import java.util.Map
import scala.beans.BeanProperty

class ActionExtention extends ActionSupport with ActionVocabilary with SessionAware {
  var servletContext = ServletActionContext.getServletContext();
  @BeanProperty var ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
  @BeanProperty var session = ActionContext.getContext().getSession();
  @BeanProperty var actionMessage, errorMessage: String = _;
  @BeanProperty var resultMap: Map[String, Object] = new HashMap[String, Object]();

}