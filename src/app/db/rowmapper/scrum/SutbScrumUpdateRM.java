package app.db.rowmapper.scrum;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.scrum.SutbCategory;
import app.db.model.scrum.SutbReportDetail;
import app.db.model.scrum.SutbScrumUpdate;
import app.db.model.scrum.SutbSubCategory;
import app.db.model.user.AptbUser;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class SutbScrumUpdateRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

		BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(
				new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			SutbScrumUpdate setterOBJ = (SutbScrumUpdate) factory.getBean("sutbScrumUpdate");

			SutbReportDetail sutbReportDetail = (SutbReportDetail) factory
					.getBean("sutbReportDetail");
			SutbCategory sutbCategory = (SutbCategory) factory.getBean("sutbCategory");
			SutbSubCategory sutbSubCategory = (SutbSubCategory) factory.getBean("sutbSubCategory");
			AptbUser aptbUser = (AptbUser) factory.getBean("aptbUser");

			setterOBJ.setSutbScrumUpdateId(resultSetOBJ.getString("SUTB_SCRUM_UPDATE_ID"));
			setterOBJ.setMemberId(resultSetOBJ.getString("MEMBER_ID"));
			setterOBJ.setUpdateTxt(resultSetOBJ.getString("UPDATE_TXT"));
			setterOBJ.setHoursSpent(resultSetOBJ.getString("HOURS_SPENT"));

			setterOBJ.setActSts(resultSetOBJ.getString("ACT_STS"));
			setterOBJ.setCreatedOn(resultSetOBJ.getString("CREATED_ON"));
			setterOBJ.setUpdatedOn(resultSetOBJ.getString("UPDATED_ON"));
			setterOBJ.setCreatedBy(resultSetOBJ.getString("CREATED_BY"));
			setterOBJ.setUpdatedBy(resultSetOBJ.getString("UPDATED_BY"));

			sutbReportDetail.setSutbReportDetailId(resultSetOBJ.getString("SUTB_REPORT_DETAIL_ID"));
			sutbReportDetail.setReportName(resultSetOBJ.getString("REPORT_NAME"));
			sutbReportDetail.setDisplayName(resultSetOBJ.getString("REPORT_DISPLAY_NAME"));

			sutbCategory.setSutbCategoryId(resultSetOBJ.getString("SUTB_CATEGORY_ID"));
			sutbCategory.setCategory(resultSetOBJ.getString("CATEGORY"));

			sutbSubCategory.setSutbSubCategoryId(resultSetOBJ.getString("SUTB_SUB_CATEGORY_ID"));
			sutbSubCategory.setSubCategory(resultSetOBJ.getString("SUB_CATEGORY"));

			aptbUser.setFullName(resultSetOBJ.getString("FULL_NAME"));

			setterOBJ.setSutbReportDetail(sutbReportDetail);
			setterOBJ.setSutbCategory(sutbCategory);
			setterOBJ.setSutbSubCategory(sutbSubCategory);
			setterOBJ.setAptbUser(aptbUser);

			return setterOBJ;
		}
	}

}
