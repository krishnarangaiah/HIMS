package app.db.dao.scrum;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.StoredProcedure;

public class SuprScrumUpdateDelete extends StoredProcedure {

	public SuprScrumUpdateDelete(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_SCRUM_UPDATE_DELETE"); // Procedure Name

		this.declareParameter(new SqlParameter("pIN_SUTB_SCRUM_UPDATE_ID", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		// this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new
		// SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> deleteScrumUpdate(String sutbScrumUpdateId) {

		Map<String, String> inParams = new HashMap<String, String>();

		inParams.put("pIN_SUTB_SCRUM_UPDATE_ID", sutbScrumUpdateId);

		return this.execute(inParams);
	}

}
