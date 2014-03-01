package app.db.dao.user;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

import app.utils.General;

public class ApprUserAdd extends StoredProcedure {

	public ApprUserAdd(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_ADD"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_APTB_USER_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_USER_NAME", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_USER_PASSWORD", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_FULL_NAME", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_MOBILE_NO", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_EMAIL_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_APTB_ROLE_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_CREATED_BY", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_MICRO_MNGMT", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_FEEDBACK_REQ", Types.VARCHAR));

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		// this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new
		// SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> addUser(String userName, String userPassword, String fullName,
			String mobileNo, String emailId, String createdBy, String microMngmt,String feedbackReq, String aptbRoleId) {

		Map<String, String> inParams = new HashMap<String, String>();

		inParams.put("pIN_APTB_USER_ID", General.getUUID());
		inParams.put("pIN_USER_NAME", userName);
		inParams.put("pIN_USER_PASSWORD", userPassword);
		inParams.put("pIN_FULL_NAME", fullName);
		inParams.put("pIN_MOBILE_NO", mobileNo);
		inParams.put("pIN_EMAIL_ID", emailId);
		inParams.put("pIN_APTB_ROLE_ID", aptbRoleId);
		inParams.put("pIN_CREATED_BY", createdBy);
		inParams.put("pIN_MICRO_MNGMT", microMngmt);
		inParams.put("pIN_FEEDBACK_REQ", feedbackReq);

		return this.execute(inParams);
	}

}
