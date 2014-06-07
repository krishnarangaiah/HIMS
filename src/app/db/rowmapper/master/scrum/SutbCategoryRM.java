package app.db.rowmapper.master.scrum;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.core.services.AppBeanFactory;
import app.db.model.scrum.SutbCategory;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbCategoryRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		// BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbCategory setterOBJ = new SutbCategory();//(SutbCategory) AppBeanFactory.factory().getBean("sutbCategory");

			setterOBJ.setSutbCategoryId(resultSetOBJ.getString("SUTB_CATEGORY_ID"));
			setterOBJ.setSutbReportDetailId(resultSetOBJ.getString("SUTB_REPORT_DETAIL_ID"));
			setterOBJ.setCategory(resultSetOBJ.getString("CATEGORY"));

			return setterOBJ;
		}
	}

}
