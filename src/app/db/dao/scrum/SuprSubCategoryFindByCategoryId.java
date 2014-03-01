package app.db.dao.scrum;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import app.db.rowmapper.scrum.SutbSubCategoryRM;

public class SuprSubCategoryFindByCategoryId extends StoredProcedure {

	public SuprSubCategoryFindByCategoryId(DataSource dataSource) {

		super(dataSource, "");
		this.setFunction(false);
		this.setSql("SUPR_SUB_CATEGORY_FIND_BY_CATEGORY_ID");

		this.declareParameter(new SqlParameter("pIN_SUTB_CATEGORY_ID", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ACTION_MSG", Types.VARCHAR));
		this.declareParameter(new SqlOutParameter("pOUT_ERROR_MSG", Types.VARCHAR));
		this.declareParameter(new SqlReturnResultSet("pRESULTSET_ROWS", new SutbSubCategoryRM()));

		// this.setUpdatableResults(true);
		this.compile();
	}

	public Map<String, Object> getSubCategoryListByCategoryId(String sutbCategoryId) {

		Map<String, String> inParams = new HashMap<String, String>();
		inParams.put("pIN_SUTB_CATEGORY_ID", sutbCategoryId);

		return this.execute(inParams);
	}
}