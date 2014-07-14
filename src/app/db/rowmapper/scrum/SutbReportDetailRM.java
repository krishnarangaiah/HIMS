package app.db.rowmapper.scrum;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.scrum.SutbReportDetail;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbReportDetailRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

	//	BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbReportDetail setterOBJ =  new SutbReportDetail(); //(SutbReportDetail) AppBeanFactory.factory().getBean("sutbReportDetail");

			setterOBJ.setSutbReportDetailId(resultSetOBJ.getString("SUTB_REPORT_DETAIL_ID"));
			setterOBJ.setReportName(resultSetOBJ.getString("REPORT_NAME"));
			setterOBJ.setDisplayName(resultSetOBJ.getString("DISPLAY_NAME"));
			setterOBJ.setScrumMasterId(resultSetOBJ.getString("SCRUM_MASTER_ID"));
			setterOBJ.setReportEvenDt(resultSetOBJ.getString("REPORT_EVEN_DT"));
			setterOBJ.setActSts(resultSetOBJ.getString("ACT_STS"));
			setterOBJ.setCreatedOn(resultSetOBJ.getString("CREATED_ON"));
			setterOBJ.setUpdatedOn(resultSetOBJ.getString("UPDATED_ON"));
			setterOBJ.setCreatedBy(resultSetOBJ.getString("CREATED_BY"));
			setterOBJ.setUpdatedBy(resultSetOBJ.getString("UPDATED_BY"));

			return setterOBJ;
		}
	}

}
