package app.db.dao.user;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.user.AptbUserRM;

public class Login extends StoredProcedure {

	public Login(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_LOGIN"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_USER_NAME", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new AptbUserRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> login(String userName) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_USER_NAME", userName);

		return this.execute(inParams);
	}

}
