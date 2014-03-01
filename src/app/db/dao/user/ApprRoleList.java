package app.db.dao.user;

import java.sql.Types;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.user.AptbRoleRM;

public class ApprRoleList extends StoredProcedure {

	public ApprRoleList(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("APPR_ROLE_LIST");

		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new AptbRoleRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getRoleList() {
		return this.execute();
	}

}
