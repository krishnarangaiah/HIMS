package app.db.model.scrum;

import java.io.Serializable;

public class SutbSubCategory implements Serializable {

	private static final long serialVersionUID = 1L;

	private String sutbSubCategoryId;
	private String sutbCategoryId;
	private String subCategory;

	public String getSutbSubCategoryId() {
		return sutbSubCategoryId;
	}

	public void setSutbSubCategoryId(String sutbSubCategoryId) {
		this.sutbSubCategoryId = sutbSubCategoryId;
	}

	public String getSutbCategoryId() {
		return sutbCategoryId;
	}

	public void setSutbCategoryId(String sutbCategoryId) {
		this.sutbCategoryId = sutbCategoryId;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

}
