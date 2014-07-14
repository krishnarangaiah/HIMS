package app.db.dao.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;

import app.db.dao.master.SuprWorkingDaysList;
import app.db.model.master.SutbWorkingDays;
import framework.core.setup.app.action.extentions.ActionExtention;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class DaoJunitTest extends ActionExtention implements DataAccessVocabilary {

	private String actionMessage, errorMessage;
	private Map<String, Object> resultMap = new HashMap<String, Object>();

	// private static BeanFactory factory = (BeanFactory) (new
	// ClassPathXmlApplicationContext(new String[] { "classpath:" +
	// APPLICATION_CONTEX_XML }));

	@Test
	public void testSuprWorkingDaysList() {

		List<SutbWorkingDays> sutbWorkingDays = null;
		SuprWorkingDaysList suprWorkingDaysList = (SuprWorkingDaysList) getCtx().getBean("suprWorkingDaysList");
		setResultMap(suprWorkingDaysList.getWorkingDaysList());
		sutbWorkingDays = (List<SutbWorkingDays>) getResultMap().get("pRESULTSET_ROWS");

		switch (sutbWorkingDays.size()) {
		case 7:
			Assert.assertTrue(sutbWorkingDays.get(6).getWeekDay().equals("SUN"));
		case 6:
			Assert.assertTrue(sutbWorkingDays.get(5).getWeekDay().equals("SAT"));
		case 5:
			Assert.assertTrue(sutbWorkingDays.get(4).getWeekDay().equals("FRI"));
		case 4:
			Assert.assertTrue(sutbWorkingDays.get(3).getWeekDay().equals("THU"));
		case 3:
			Assert.assertTrue(sutbWorkingDays.get(2).getWeekDay().equals("WED"));
		case 2:
			Assert.assertTrue(sutbWorkingDays.get(1).getWeekDay().equals("TUE"));
		case 1:
			Assert.assertTrue(sutbWorkingDays.get(0).getWeekDay().equals("MON"));
			break;
		default:
			Assert.assertTrue(false);
		}

	}

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

}
