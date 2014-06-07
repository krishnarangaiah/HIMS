package app.core.services

import org.springframework.beans.factory.BeanFactory
import org.springframework.context.support.ClassPathXmlApplicationContext

import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary

object AppBeanFactory {

  var factory = (new ClassPathXmlApplicationContext(new String("classpath:" + DataAccessVocabilary.APPLICATION_CONTEX))).asInstanceOf[BeanFactory]

}