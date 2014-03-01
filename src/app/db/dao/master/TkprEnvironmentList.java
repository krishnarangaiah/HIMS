package app.db.dao.master;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.master.TktbEnvironmentRM;

public class TkprEnvironmentList extends StoredProcedure {

	public TkprEnvironmentList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("TKPR_ENVIRONMENT_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new TktbEnvironmentRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getEnvironmentList() {
		return this.execute();
	}

}
