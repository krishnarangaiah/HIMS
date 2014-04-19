package app.actions.session.off

import scala.beans.BeanProperty
import org.apache.log4j.Logger
import org.springframework.beans.factory.BeanFactory
import org.springframework.context.support.ClassPathXmlApplicationContext
import com.opensymphony.xwork2.Action
import app.db.model.user.AptbUser
import framework.core.custom.log4j.logger.levels.AppLevel
import framework.core.setup.app.action.extentions.ActionExtension
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary
import app.db.dao.user.Login
import java.util.ArrayList
import framework.core.setup.app.action.vocabilary.ActionVocabilary

class BeforeSessionAction extends ActionExtension with DataAccessVocabilary {

  private val LOGGER = Logger.getLogger(classOf[BeforeSessionAction]);

  private var factory = (new ClassPathXmlApplicationContext(new String("classpath:" + DataAccessVocabilary.APPLICATION_CONTEX_XML))).asInstanceOf[BeanFactory]

  override def execute() = Action.SUCCESS

  // Process Login User
  var login = factory.getBean("login").asInstanceOf[Login]

  @BeanProperty var userName, userPassword: String = _
  @BeanProperty var aptbUsers: List[Object] = List()

  /**
   *
   */
  def processLogin = {

    LOGGER log (AppLevel.APP_UM_DEBUG, "Processing user login action")
    LOGGER log (AppLevel.APP_UM_INFO, "UserName: " + userName + " UserPassword: " + userPassword)
    setResultMap(login login (userName));
    LOGGER log (AppLevel.APP_UM_DEBUG, "Accessed database for login")
    aptbUsers = getResultMap().get("pRESULTSET_ROWS").asInstanceOf[ArrayList[AptbUser]].toArray.toList

    if (aptbUsers.nonEmpty) {
      //TODO: Coding required
      if (aptbUsers(0).asInstanceOf[AptbUser].getUserPassword.equals(userPassword)) {
        getSession().put("SESSION_USER", aptbUsers(0));
        setActionMessage("Login is Successful");
        // setResultMap(tkprProductList.getProductList());
        Action.SUCCESS;
      } else {
        setErrorMessage("Password is Wrong");
        ActionVocabilary.APP_LOGIN;
      }

    } else {
      LOGGER log (AppLevel.APP_UM_DEBUG, "No user found")
      setErrorMessage("User does not exists")
      ActionVocabilary.APP_LOGIN;
    }

    Action.SUCCESS
  }

}