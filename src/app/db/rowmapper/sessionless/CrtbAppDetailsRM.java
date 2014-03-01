package app.db.rowmapper.sessionless;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;
import app.db.model.sessionless.CrtbAppDetails;

public class CrtbAppDetailsRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" +  APPLICATION_CONTEX_XML}));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			CrtbAppDetails setterOBJ = (CrtbAppDetails) factory.getBean("crtbAppDetails");

			setterOBJ.setCrtbAppDetailsId(resultSetOBJ.getString("CRTB_APP_DETAILS_ID"));
			setterOBJ.setParamName(resultSetOBJ.getString("PARAM_NAME"));
			setterOBJ.setParamValue(resultSetOBJ.getString("PARAM_VALUE"));
			setterOBJ.setActStatus(resultSetOBJ.getString("ACT_STATUS"));
			setterOBJ.setCreatedOn(resultSetOBJ.getString("CREATED_ON"));
			setterOBJ.setCreatedBy(resultSetOBJ.getString("CREATED_BY"));
			setterOBJ.setUpdatedOn(resultSetOBJ.getString("UPDATED_ON"));
			setterOBJ.setUpdatedBy(resultSetOBJ.getString("UPDATED_BY"));

			return setterOBJ;
		}
	}

}
