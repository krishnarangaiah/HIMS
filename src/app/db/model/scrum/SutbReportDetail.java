package app.db.model.scrum;

import java.io.Serializable;

public class SutbReportDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	private String sutbReportDetailId;
	private String reportName;
	private String displayName;
	private String scrumMasterId;
	private String reportEvenDt;
	private String actSts;
	private String createdOn;
	private String updatedOn;
	private String createdBy;
	private String updatedBy;

	public String getSutbReportDetailId() {
		return sutbReportDetailId;
	}

	public void setSutbReportDetailId(String sutbReportDetailId) {
		this.sutbReportDetailId = sutbReportDetailId;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getScrumMasterId() {
		return scrumMasterId;
	}

	public void setScrumMasterId(String scrumMasterId) {
		this.scrumMasterId = scrumMasterId;
	}

	public String getReportEvenDt() {
		return reportEvenDt;
	}

	public void setReportEvenDt(String reportEvenDt) {
		this.reportEvenDt = reportEvenDt;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	public String getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

}
