package app.db.model.scrum;

import java.io.Serializable;

public class SutbCategory implements Serializable {

	private static final long serialVersionUID = 1L;

	private String sutbCategoryId;
	private String sutbReportDetailId;
	private String category;

	public String getSutbCategoryId() {
		return sutbCategoryId;
	}

	public void setSutbCategoryId(String sutbCategoryId) {
		this.sutbCategoryId = sutbCategoryId;
	}

	public String getSutbReportDetailId() {
		return sutbReportDetailId;
	}

	public void setSutbReportDetailId(String sutbReportDetailId) {
		this.sutbReportDetailId = sutbReportDetailId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
