package app.db.rowmapper.master;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.master.SutbWorkingDays;
import app.db.model.master.TktbCategory;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbWorkingDaysRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbWorkingDays setterOBJ = (SutbWorkingDays) factory.getBean("sutbWorkingDays");

			setterOBJ.setSutbWorkingDaysId(resultSetOBJ.getString("SUTB_WORKING_DAYS_ID"));
			setterOBJ.setWeekDay(resultSetOBJ.getString("WEEK_DAY"));

			return setterOBJ;
		}
	}

}
