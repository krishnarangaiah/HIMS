package app.db.dao.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class AppTest implements DataAccessVocabilary {
	private static BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(
			new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

	public static void main(String[] args) {

	}
}
