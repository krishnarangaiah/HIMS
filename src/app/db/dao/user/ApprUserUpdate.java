package app.db.dao.user;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

public class ApprUserUpdate extends StoredProcedure {

	public ApprUserUpdate(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_UPDATE"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_APTB_USER_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_USER_NAME", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_USER_PASSWORD", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_FULL_NAME", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_MOBILE_NO", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_EMAIL_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_APTB_ROLE_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_ACT_STS", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_MICRO_MNGMT", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_FEEDBACK_REQ", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_UPDATED_BY", Types.VARCHAR));

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		// this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new
		// SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> editUser(String aptbUserId, String userName, String userPassword,
			String fullName, String mobileNo, String emailId, String aptbRoleId, String actSts,
			String microMngmt, String feedbackReq, String updatedBy) {

		Map<String, String> inParams = new HashMap<String, String>();

		inParams.put("pIN_APTB_USER_ID", aptbUserId);
		inParams.put("pIN_USER_NAME", userName);
		inParams.put("pIN_USER_PASSWORD", userPassword);
		inParams.put("pIN_FULL_NAME", fullName);
		inParams.put("pIN_MOBILE_NO", mobileNo);
		inParams.put("pIN_EMAIL_ID", emailId);
		inParams.put("pIN_APTB_ROLE_ID", aptbRoleId);
		inParams.put("pIN_ACT_STS", actSts);
		inParams.put("pIN_MICRO_MNGMT", microMngmt);
		inParams.put("pIN_FEEDBACK_REQ", feedbackReq);
		inParams.put("pIN_UPDATED_BY", updatedBy);

		return this.execute(inParams);
	}
}