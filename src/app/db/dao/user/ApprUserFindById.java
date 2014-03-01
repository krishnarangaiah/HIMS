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

public class ApprUserFindById extends StoredProcedure {

	public ApprUserFindById(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_FIND_BY_ID");

		this.declareParameter(new SqlParameter("pIN_APTB_USER_ID", Types.VARCHAR));

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));

		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new AptbUserRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getDetails(String aptbUserId) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_APTB_USER_ID", aptbUserId);

		return this.execute(inParams);
	}


}
