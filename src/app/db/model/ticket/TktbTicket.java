package app.db.model.ticket;

import java.io.Serializable;

public class TktbTicket implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tktbTicketId;
	private String ticketId;
	private String subject;
	private String disc;
	private String simulationSteps;
	private String issueType;
	private String assignedTo;
	private String eta;
	private String reopenedCount;
	private String tktbProductId;
	private String tktbEnvironment;
	private String tktbStatusId;
	private String tktbCategoryId;
	private String tktbSeverityId;
	private String createdOn;
	private String updatedOn;
	private String createdBy;
	private String updatedBy;

	public String getTktbTicketId() {
		return tktbTicketId;
	}

	public void setTktbTicketId(String tktbTicketId) {
		this.tktbTicketId = tktbTicketId;
	}

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDisc() {
		return disc;
	}

	public void setDisc(String disc) {
		this.disc = disc;
	}

	public String getSimulationSteps() {
		return simulationSteps;
	}

	public void setSimulationSteps(String simulationSteps) {
		this.simulationSteps = simulationSteps;
	}

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}

	public String getReopenedCount() {
		return reopenedCount;
	}

	public void setReopenedCount(String reopenedCount) {
		this.reopenedCount = reopenedCount;
	}

	public String getTktbProductId() {
		return tktbProductId;
	}

	public void setTktbProductId(String tktbProductId) {
		this.tktbProductId = tktbProductId;
	}

	public String getTktbEnvironment() {
		return tktbEnvironment;
	}

	public void setTktbEnvironment(String tktbEnvironment) {
		this.tktbEnvironment = tktbEnvironment;
	}

	public String getTktbStatusId() {
		return tktbStatusId;
	}

	public void setTktbStatusId(String tktbStatusId) {
		this.tktbStatusId = tktbStatusId;
	}

	public String getTktbCategoryId() {
		return tktbCategoryId;
	}

	public void setTktbCategoryId(String tktbCategoryId) {
		this.tktbCategoryId = tktbCategoryId;
	}

	public String getTktbSeverityId() {
		return tktbSeverityId;
	}

	public void setTktbSeverityId(String tktbSeverityId) {
		this.tktbSeverityId = tktbSeverityId;
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