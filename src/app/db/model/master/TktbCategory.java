package app.db.model.master;

import java.io.Serializable;

public class TktbCategory implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tktbCategoryId;
	private String category;
	private String actSts;

	public String getTktbCategoryId() {
		return tktbCategoryId;
	}

	public void setTktbCategoryId(String tktbCategoryId) {
		this.tktbCategoryId = tktbCategoryId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

}