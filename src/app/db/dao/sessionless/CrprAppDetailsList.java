package app.db.dao.sessionless;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.sessionless.CrtbAppDetailsRM;

public class CrprAppDetailsList extends StoredProcedure  {

	public CrprAppDetailsList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("CRPR_APP_DETAILS_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new CrtbAppDetailsRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getCrprAppDetailsList() {
		return this.execute();
	}

}
