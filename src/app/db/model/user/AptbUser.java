package app.db.model.user;

import java.io.Serializable;

public class AptbUser implements Serializable {

	private static final long serialVersionUID = 1L;

	private String aptbUserId;
	private String userName;
	private String userPassword;
	private String fullName;
	private String mobileNo;
	private String emailId;
	private String actSts;
	private String microMngmt;
	private String createdOn;
	private String updatedOn;
	private String createdBy;
	private String updatedBy;
	private AptbRole aptbRole;
	private String nameAndRole;
	private String feedbackReq;

	public String getAptbUserId() {
		return aptbUserId;
	}

	public void setAptbUserId(String aptbUserId) {
		this.aptbUserId = aptbUserId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
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

	public AptbRole getAptbRole() {
		return aptbRole;
	}

	public void setAptbRole(AptbRole aptbRole) {
		this.aptbRole = aptbRole;
	}

	public void setNameAndRole(String nameAndRole) {
		this.nameAndRole = nameAndRole;
	}

	public String getNameAndRole() {
		nameAndRole = fullName + " (" + aptbRole.getRole() + ")";
		return nameAndRole;
	}

	public String getMicroMngmt() {
		return microMngmt;
	}

	public void setMicroMngmt(String microMngmt) {
		this.microMngmt = microMngmt;
	}

	public String getFeedbackReq() {
		return feedbackReq;
	}

	public void setFeedbackReq(String feedbackReq) {
		this.feedbackReq = feedbackReq;
	}

}
