package app.db.dao.scrum;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.scrum.SutbReportDetailRM;

public class SuprReportDetailList extends StoredProcedure {

	public SuprReportDetailList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_REPORT_DETAIL_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbReportDetailRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getReportList() {
		return this.execute();
	}
}