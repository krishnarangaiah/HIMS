package app.db.dao.user;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.user.AptbUserRM;

public class AptbUserList extends StoredProcedure {

	public AptbUserList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_USER_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new AptbUserRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getUserList() {
		return this.execute();
	}

}
