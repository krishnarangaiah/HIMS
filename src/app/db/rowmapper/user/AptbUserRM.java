package app.db.rowmapper.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.user.AptbRole;
import app.db.model.user.AptbUser;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class AptbUserRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

	//	BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			AptbUser setterOBJ = new AptbUser();//(AptbUser) factory.getBean("aptbUser");
			AptbRole aptbRole = new AptbRole();//(AptbRole) factory.getBean("aptbRole");

			setterOBJ.setAptbUserId(resultSetOBJ.getString("APTB_USER_ID"));
			setterOBJ.setUserName(resultSetOBJ.getString("USER_NAME"));
			setterOBJ.setUserPassword(resultSetOBJ.getString("USER_PASSWORD"));
			setterOBJ.setFullName(resultSetOBJ.getString("FULL_NAME"));
			setterOBJ.setMobileNo(resultSetOBJ.getString("MOBILE_NO"));
			setterOBJ.setEmailId(resultSetOBJ.getString("EMAIL_ID"));
			setterOBJ.setActSts(resultSetOBJ.getString("ACT_STS"));
			setterOBJ.setMicroMngmt(resultSetOBJ.getString("MICRO_MNGMT"));
			setterOBJ.setFeedbackReq(resultSetOBJ.getString("FEEDBACK_REQ"));
			setterOBJ.setCreatedOn(resultSetOBJ.getString("CREATED_ON"));
			setterOBJ.setUpdatedOn(resultSetOBJ.getString("UPDATED_ON"));
			setterOBJ.setCreatedBy(resultSetOBJ.getString("CREATED_BY"));
			setterOBJ.setUpdatedBy(resultSetOBJ.getString("UPDATED_BY"));

			aptbRole.setAptbRoleId(resultSetOBJ.getString("APTB_ROLE_ID"));
			aptbRole.setRole(resultSetOBJ.getString("ROLE"));
			aptbRole.setDiplayName(resultSetOBJ.getString("DISPLAY_NAME"));
			aptbRole.setRoleLevel(resultSetOBJ.getString("ROLE_LEVEL"));
			aptbRole.setUserMemt(resultSetOBJ.getString("USER_MGMT"));

			setterOBJ.setAptbRole(aptbRole);

			return setterOBJ;
		}
	}

}
