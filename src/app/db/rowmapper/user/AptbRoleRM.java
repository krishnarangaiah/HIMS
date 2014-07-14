package app.db.rowmapper.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import app.db.model.user.AptbRole;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class AptbRoleRM implements RowMapper<Object> {

	@Override
	public Object mapRow(ResultSet resultSetOBJ, int line) throws SQLException {
		RmSetter rowMapperOBJ = new RmSetter();
		return rowMapperOBJ.extractData(resultSetOBJ);
	}

	private class RmSetter implements ResultSetExtractor<Object>, DataAccessVocabilary {

//		BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(
//				new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

		public Object extractData(ResultSet resultSetOBJ) throws SQLException {
			AptbRole setterOBJ = new AptbRole();//(AptbRole) AppBeanFactory.factory().getBean("aptbRole");

			setterOBJ.setAptbRoleId(resultSetOBJ.getString("APTB_ROLE_ID"));
			setterOBJ.setRole(resultSetOBJ.getString("ROLE"));
			setterOBJ.setDiplayName(resultSetOBJ.getString("DISPLAY_NAME"));
			setterOBJ.setActSts(resultSetOBJ.getString("ACT_STS"));

			return setterOBJ;
		}
	}

}
