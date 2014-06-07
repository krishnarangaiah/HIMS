package app.db.rowmapper.master;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.core.services.AppBeanFactory;
import app.db.model.master.TktbCategory;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class TktbCategoryRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		// BeanFactory factory = (BeanFactory) (new
		// ClassPathXmlApplicationContext(new String[] { "classpath:" +
		// APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			TktbCategory setterOBJ = new TktbCategory(); // (TktbCategory)
															// AppBeanFactory.factory().getBean("tktbCategory");

			setterOBJ.setTktbCategoryId(resultSetOBJ.getString("TKTB_CATEGORY_ID"));
			setterOBJ.setCategory(resultSetOBJ.getString("CATEGORY"));
			setterOBJ.setActSts(resultSetOBJ.getString("ACT_STS"));

			return setterOBJ;
		}
	}

}
