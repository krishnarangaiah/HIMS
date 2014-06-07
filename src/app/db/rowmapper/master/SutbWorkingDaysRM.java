package app.db.rowmapper.master;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.core.services.AppBeanFactory;
import app.db.model.master.SutbWorkingDays;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbWorkingDaysRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbWorkingDays setterOBJ = new SutbWorkingDays();
			// (SutbWorkingDays)
			// AppBeanFactory.factory().getBean("sutbWorkingDays");

			setterOBJ.setSutbWorkingDaysId(resultSetOBJ.getString("SUTB_WORKING_DAYS_ID"));
			setterOBJ.setWeekDay(resultSetOBJ.getString("WEEK_DAY"));

			return setterOBJ;
		}
	}

}
