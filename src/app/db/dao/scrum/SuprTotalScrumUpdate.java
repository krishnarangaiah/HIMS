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

public class SuprTotalScrumUpdate extends StoredProcedure {

	public SuprTotalScrumUpdate(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_TOTAL_SCRUM_UPDATE");

		this.declareParameter(new SqlParameter("pIN_MEMBER_ID", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbScrumUpdateRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getUpdatesList(String memberId) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_MEMBER_ID", memberId);

		return this.execute(inParams);
	}
}