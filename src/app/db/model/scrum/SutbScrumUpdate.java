package app.db.model.scrum;

import java.io.Serializable;

import app.db.model.user.AptbUser;

public class SutbScrumUpdate implements Serializable {

	private static final long serialVersionUID = 1L;

	private String sutbScrumUpdateId;
	private String memberId;
	private String updateTxt;
	private String hoursSpent;
	private String actSts;
	private String createdOn;
	private String updatedOn;
	private String createdBy;
	private String updatedBy;

	private SutbReportDetail sutbReportDetail;
	private SutbCategory sutbCategory;
	private SutbSubCategory sutbSubCategory;
	private AptbUser aptbUser;

	public String getSutbScrumUpdateId() {
		return sutbScrumUpdateId;
	}

	public void setSutbScrumUpdateId(String sutbScrumUpdateId) {
		this.sutbScrumUpdateId = sutbScrumUpdateId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getUpdateTxt() {
		return updateTxt;
	}

	public void setUpdateTxt(String updateTxt) {
		this.updateTxt = updateTxt;
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

	public SutbReportDetail getSutbReportDetail() {
		return sutbReportDetail;
	}

	public void setSutbReportDetail(SutbReportDetail sutbReportDetail) {
		this.sutbReportDetail = sutbReportDetail;
	}

	public SutbCategory getSutbCategory() {
		return sutbCategory;
	}

	public void setSutbCategory(SutbCategory sutbCategory) {
		this.sutbCategory = sutbCategory;
	}

	public SutbSubCategory getSutbSubCategory() {
		return sutbSubCategory;
	}

	public void setSutbSubCategory(SutbSubCategory sutbSubCategory) {
		this.sutbSubCategory = sutbSubCategory;
	}

	public AptbUser getAptbUser() {
		return aptbUser;
	}

	public void setAptbUser(AptbUser aptbUser) {
		this.aptbUser = aptbUser;
	}

	public String getHoursSpent() {
		return hoursSpent;
	}

	public void setHoursSpent(String hoursSpent) {
		this.hoursSpent = hoursSpent;
	}

}
