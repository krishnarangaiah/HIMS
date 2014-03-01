package app.db.dao.user;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

public class ApprUserDelete extends StoredProcedure {

	public ApprUserDelete(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_DELETE"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_APTB_USER_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_ACTION_BY", Types.VARCHAR));

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> deleteUser(String aptbUserId, String actionBy) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_APTB_USER_ID", aptbUserId);
		inParams.put("pIN_ACTION_BY", actionBy);

		return this.execute(inParams);
	}

}
