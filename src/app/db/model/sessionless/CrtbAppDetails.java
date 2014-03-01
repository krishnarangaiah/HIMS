package app.db.model.sessionless;

import java.io.Serializable;

public class CrtbAppDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	private String crtbAppDetailsId;
	private String paramName;
	private String paramValue;
	private String actStatus;
	private String createdOn;
	private String createdBy;
	private String updatedOn;
	private String updatedBy;

	public String getCrtbAppDetailsId() {
		return crtbAppDetailsId;
	}

	public void setCrtbAppDetailsId(String crtbAppDetailsId) {
		this.crtbAppDetailsId = crtbAppDetailsId;
	}

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}

	public String getActStatus() {
		return actStatus;
	}

	public void setActStatus(String actStatus) {
		this.actStatus = actStatus;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

}