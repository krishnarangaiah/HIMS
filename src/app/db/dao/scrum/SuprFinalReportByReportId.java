package app.db.dao.scrum;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.scrum.SutbScrumUpdateRM;

public class SuprFinalReportByReportId extends StoredProcedure {

	public SuprFinalReportByReportId(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_FINAL_REPORT_BY_REPORT_ID");

		this.declareParameter(new SqlParameter("pIN_SUTB_REPORT_DETAIL_ID", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getUpdatesList(String sutbReportDetailId) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_SUTB_REPORT_DETAIL_ID", sutbReportDetailId);

		return this.execute(inParams);
	}
}