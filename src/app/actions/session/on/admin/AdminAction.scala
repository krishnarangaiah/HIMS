package app.actions.session.on.admin

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.BeanFactory
import org.springframework.context.support.ClassPathXmlApplicationContext
import com.opensymphony.xwork2.Action
import scala.beans.BeanProperty
import framework.core.setup.app.action.extentions.ActionExtension
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary

class AdminAction extends ActionExtension with DataAccessVocabilary {

  private val LOGGER = LoggerFactory.getLogger(classOf[AdminAction])
  private var factory = (new ClassPathXmlApplicationContext(new String("classpath:" + DataAccessVocabilary.APPLICATION_CONTEX_XML))).asInstanceOf[BeanFactory]

  override def execute() = Action.SUCCESS

  @BeanProperty var monWorkingFlag, tueWorkingFlag, wedWorkingFlag, thuWorkingFlag, friWorkingFlag, satWorkingFlag, sunWorkingFlag, monReceptionFlag, tueReceptionFlag, wedReceptionFlag, thuReceptionFlag, friReceptionFlag, satReceptionFlag, sunReceptionFlag: String = _

  def processWeekdaySettings() = {

    LOGGER info (monWorkingFlag)
    LOGGER info (tueWorkingFlag)
    LOGGER info (wedWorkingFlag)
    LOGGER info (thuWorkingFlag)
    LOGGER info (friWorkingFlag)
    LOGGER info (satWorkingFlag)
    LOGGER info (sunWorkingFlag)

    LOGGER info (monReceptionFlag)
    LOGGER info (tueReceptionFlag)
    LOGGER info (wedReceptionFlag)
    LOGGER info (thuReceptionFlag)
    LOGGER info (friReceptionFlag)
    LOGGER info (satReceptionFlag)
    LOGGER info (sunReceptionFlag)

    Action.SUCCESS;
  }

} 