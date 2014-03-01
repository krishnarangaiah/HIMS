package app.db.rowmapper.scrum;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.scrum.SutbSubCategory;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbSubCategoryRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbSubCategory setterOBJ = (SutbSubCategory) factory.getBean("sutbSubCategory");

			setterOBJ.setSutbSubCategoryId(resultSetOBJ.getString("SUTB_SUB_CATEGORY_ID"));
			setterOBJ.setSutbCategoryId(resultSetOBJ.getString("SUTB_CATEGORY_ID"));
			setterOBJ.setSubCategory(resultSetOBJ.getString("SUB_CATEGORY"));

			return setterOBJ;
		}
	}

}
