package app.db.dao.master;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.master.SutbWorkingDaysRM;

public class SuprWorkingDaysList extends StoredProcedure {

	public SuprWorkingDaysList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_WORKING_DAYS_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbWorkingDaysRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getWorkingDaysList() {
		return this.execute();
	}

}
