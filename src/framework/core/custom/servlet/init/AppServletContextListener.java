//package framework.core.custom.servlet.init;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//
//import org.apache.log4j.Logger;
//import org.springframework.beans.factory.BeanFactory;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import app.db.dao.sessionless.CrprAppDetailsList;
//import app.db.model.sessionless.CrtbAppDetails;
//import framework.core.custom.log4j.logger.levels.AppLevel;
//import framework.core.setup.app.action.extentions.ActionExtension;
//import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;
//
//public class AppServletContextListener implements ServletContextListener, DataAccessVocabilary {
//
//	private static final Logger LOGGER = Logger.getLogger(AppServletContextListener.class);
//
//	private List<CrtbAppDetails> crtbAppDetails;
//	private Map<String, Object> resultMap = new HashMap<String, Object>();
//
//	private static BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));
//	private CrprAppDetailsList appDetailsList = (CrprAppDetailsList) factory.getBean("crprAppDetailsList");
//
//	@Override
//	public void contextDestroyed(ServletContextEvent arg0) {
//		System.out.println("I am dying");
//
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public void contextInitialized(ServletContextEvent arg0) {
//		LOGGER.log(AppLevel.APP_DEBUG, "ContexListner initiating");
//		resultMap = appDetailsList.getCrprAppDetailsList();
//		crtbAppDetails = (List<CrtbAppDetails>) resultMap.get("pRESULTSET_ROWS");
//
//		for (CrtbAppDetails appDetails : crtbAppDetails) {
//			LOGGER.log(AppLevel.APP_DEBUG, "Found Param Name: " + appDetails.getParamName() + " with Param Value: " + appDetails.getParamValue());
//			if (appDetails.getParamName().equals("APP NAME")) {
//				ActionExtension.appCache.setAppName(appDetails.getParamValue());
//				
//			} else if (appDetails.getParamName().equals("VERSION")) {
//				ActionExtension.appCache.setVersion(appDetails.getParamValue());
//			}
//		}
//
//	}
//
//}
