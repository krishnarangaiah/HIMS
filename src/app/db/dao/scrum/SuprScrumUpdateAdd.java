package app.db.dao.scrum;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

public class SuprScrumUpdateAdd extends StoredProcedure {

	public SuprScrumUpdateAdd(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_SCRUM_UPDATE_ADD"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_SUTB_SCRUM_UPDATE_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_SUTB_REPORT_DETAIL_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_SUTB_CATEGORY_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_SUTB_SUB_CATEGORY_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_MEMBER_ID", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_UPDATE_TXT", Types.VARCHAR));
		this.declareParameter(new SqlParameter("pIN_HOURS_SPENT",Types.VARCHAR));

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		// this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> addScrumUpdate(String sutbScrumUpdateId, String sutbReportDetailId, String sutbCategoryId, String sutbSubCategoryId, String memberId, String updateTxt, String hoursSpent) {

		Map<String, String> inParams = new HashMap<String, String>();

		inParams.put("pIN_SUTB_SCRUM_UPDATE_ID", sutbScrumUpdateId);
		inParams.put("pIN_SUTB_REPORT_DETAIL_ID", sutbReportDetailId);
		inParams.put("pIN_SUTB_CATEGORY_ID", sutbCategoryId);
		inParams.put("pIN_SUTB_SUB_CATEGORY_ID", sutbSubCategoryId);
		inParams.put("pIN_MEMBER_ID", memberId);
		inParams.put("pIN_UPDATE_TXT", updateTxt);
		inParams.put("pIN_HOURS_SPENT", hoursSpent);

		return this.execute(inParams);
	}

}
