package app.actions.session.on.user;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import app.db.dao.master.TkprCategoryList;
import app.db.dao.master.TkprEnvironmentList;
import app.db.dao.scrum.SuprCategoryFindByReportId;
import app.db.dao.scrum.SuprFinalReportByReportId;
import app.db.dao.scrum.SuprReportDetailList;
import app.db.dao.scrum.SuprScrumUpdateAdd;
import app.db.dao.scrum.SuprScrumUpdateByMemberId;
import app.db.dao.scrum.SuprScrumUpdateDelete;
import app.db.dao.scrum.SuprSubCategoryFindByCategoryId;
import app.db.dao.scrum.SuprTotalScrumUpdate;
import app.db.dao.user.AptbUserList;
import app.db.model.master.TktbCategory;
import app.db.model.master.TktbEnvironment;
import app.db.model.scrum.SutbCategory;
import app.db.model.scrum.SutbReportDetail;
import app.db.model.scrum.SutbScrumUpdate;
import app.db.model.scrum.SutbSubCategory;
import app.db.model.user.AptbUser;
import app.utils.General;
import framework.core.custom.log4j.logger.levels.AppLevel;
import framework.core.setup.app.action.extentions.ActionExtension;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class UserActions extends ActionExtension implements DataAccessVocabilary {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(UserActions.class);

	private static BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(
			new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

	private TkprEnvironmentList tkprEnvironmentList = (TkprEnvironmentList) factory
			.getBean("tkprEnvironmentList");
	private AptbUserList aptbUserList = (AptbUserList) factory.getBean("aptbUserList");
	private TkprCategoryList tkprCategoryList = (TkprCategoryList) factory
			.getBean("tkprCategoryList");
	private SuprReportDetailList suprReportDetailList = (SuprReportDetailList) factory
			.getBean("suprReportDetailList");
	private SuprCategoryFindByReportId suprCategoryList = (SuprCategoryFindByReportId) factory
			.getBean("suprCategoryFindByReportId");
	private SuprSubCategoryFindByCategoryId suprSubCategoryList = (SuprSubCategoryFindByCategoryId) factory
			.getBean("suprSubCategoryFindByCategoryId");
	private SuprScrumUpdateAdd suprScrumUpdateAdd = (SuprScrumUpdateAdd) factory
			.getBean("suprScrumUpdateAdd");
	private SuprScrumUpdateByMemberId suprScrumUpdateByMemberId = (SuprScrumUpdateByMemberId) factory
			.getBean("suprScrumUpdateByMemberId");
	private SuprTotalScrumUpdate suprTotalScrumUpdate = (SuprTotalScrumUpdate) factory
			.getBean("suprTotalScrumUpdate");
	private SuprFinalReportByReportId suprFinalReportByReportId = (SuprFinalReportByReportId) factory
			.getBean("suprFinalReportByReportId");

	private SuprScrumUpdateDelete suprScrumUpdateDelete = (SuprScrumUpdateDelete) factory
			.getBean("suprScrumUpdateDelete");

	public String userHome() {

		LOGGER.log(AppLevel.APP_UM_DEBUG, "User home items");
		return SUCCESS;

	}

	public String logout() {
		getSession().remove("SESSION_USER");
		return SUCCESS;
	}

	/***************************************************************************************************************/

	private List<TktbEnvironment> tktbEnvironments;
	private List<AptbUser> aptbUsers;
	private List<TktbCategory> tktbCategories;

	/**
	 * Method to launch Ticket Screen
	 * 
	 * @return String
	 */
	public String newTicket() {

		setResultMap(tkprEnvironmentList.getEnvironmentList());
		tktbEnvironments = (List<TktbEnvironment>) getResultMap().get("pRESULTSET_ROWS");

		setResultMap(aptbUserList.getUserList());
		aptbUsers = (List<AptbUser>) getResultMap().get("pRESULTSET_ROWS");

		setResultMap(tkprCategoryList.getCategoryList());
		tktbCategories = (List<TktbCategory>) getResultMap().get("pRESULTSET_ROWS");

		return SUCCESS;
	}

	public List<TktbEnvironment> getTktbEnvironments() {
		return tktbEnvironments;
	}

	public void setTktbEnvironments(List<TktbEnvironment> tktbEnvironments) {
		this.tktbEnvironments = tktbEnvironments;
	}

	public List<AptbUser> getAptbUsers() {
		return aptbUsers;
	}

	public void setAptbUsers(List<AptbUser> aptbUsers) {
		this.aptbUsers = aptbUsers;
	}

	public List<TktbCategory> getTktbCategories() {
		return tktbCategories;
	}

	public void setTktbCategories(List<TktbCategory> tktbCategories) {
		this.tktbCategories = tktbCategories;
	}

	/*********************************************************************************************************/

	private String tktbProductId, tktbEnvironmentId, tktbCategoryId, tktbSeverityId, subject, disc,
			simulationSteps, issueType, aptbUserId, eta;

	/**
	 * Method to process new Ticket
	 * 
	 * @return String
	 */
	public String processNewTicket() {

		LOGGER.log(AppLevel.APP_UM_INFO, tktbProductId + " | " + tktbEnvironmentId + " | "
				+ tktbCategoryId + " | " + tktbSeverityId + " | " + subject + " | " + disc + " | "
				+ simulationSteps + " | " + issueType + " | " + aptbUserId + " | " + eta);

		return SUCCESS;
	}

	public TkprEnvironmentList getTkprEnvironmentList() {
		return tkprEnvironmentList;
	}

	public void setTkprEnvironmentList(TkprEnvironmentList tkprEnvironmentList) {
		this.tkprEnvironmentList = tkprEnvironmentList;
	}

	public TkprCategoryList getTkprCategoryList() {
		return tkprCategoryList;
	}

	public void setTkprCategoryList(TkprCategoryList tkprCategoryList) {
		this.tkprCategoryList = tkprCategoryList;
	}

	public String getTktbProductId() {
		return tktbProductId;
	}

	public void setTktbProductId(String tktbProductId) {
		this.tktbProductId = tktbProductId;
	}

	public String getTktbEnvironmentId() {
		return tktbEnvironmentId;
	}

	public void setTktbEnvironmentId(String tktbEnvironmentId) {
		this.tktbEnvironmentId = tktbEnvironmentId;
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

	public String getAptbUserId() {
		return aptbUserId;
	}

	public void setAptbUserId(String aptbUserId) {
		this.aptbUserId = aptbUserId;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}

	/****************************************************************************************************************/

	private List<SutbReportDetail> sutbReportDetails = new ArrayList<SutbReportDetail>();
	private List<SutbScrumUpdate> sutbScrumUpdates = new ArrayList<SutbScrumUpdate>();

	/**
	 * Method to launch Scrum update screen
	 * 
	 * @return
	 */
	public String todayScrumUpdate() {

		setResultMap(suprReportDetailList.getReportList());
		
		sutbReportDetails = (List<SutbReportDetail>) getResultMap().get("pRESULTSET_ROWS");

		setResultMap(suprScrumUpdateByMemberId.getUpdatesList(((AptbUser) getSession().get(
				"SESSION_USER")).getAptbUserId()));
		
		sutbScrumUpdates = (List<SutbScrumUpdate>) getResultMap().get("pRESULTSET_ROWS");

		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));

		return SUCCESS;

	}

	public List<SutbReportDetail> getSutbReportDetails() {
		return sutbReportDetails;
	}

	public void setSutbReportDetails(List<SutbReportDetail> sutbReportDetails) {
		this.sutbReportDetails = sutbReportDetails;
	}

	public List<SutbScrumUpdate> getSutbScrumUpdates() {
		return sutbScrumUpdates;
	}

	public void setSutbScrumUpdates(List<SutbScrumUpdate> sutbScrumUpdates) {
		this.sutbScrumUpdates = sutbScrumUpdates;
	}

	/****************************************************************************************************************/

	public String totalScrumUpdate() {

		setResultMap(suprTotalScrumUpdate.getUpdatesList(((AptbUser) getSession().get(
				"SESSION_USER")).getAptbUserId()));
		sutbScrumUpdates = (List<SutbScrumUpdate>) getResultMap().get("pRESULTSET_ROWS");

		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));

		return SUCCESS;
	}

	/****************************************************************************************************************/

	private String sutbReportDetailId;
	private List<SutbCategory> categories;

	public String getCategoryByReportId() {

		setResultMap(suprCategoryList.getCategoryListByReportId(sutbReportDetailId));
		categories = (List<SutbCategory>) getResultMap().get("pRESULTSET_ROWS");

		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));

		return SUCCESS;
	}

	public void setSutbReportDetailId(String sutbReportDetailId) {
		this.sutbReportDetailId = sutbReportDetailId;
	}

	public String getSutbReportDetailId() {
		return sutbReportDetailId;
	}

	public List<SutbCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<SutbCategory> categories) {
		this.categories = categories;
	}

	/****************************************************************************************************************/

	private String sutbCategoryId;
	private List<SutbSubCategory> subCategories;

	public String getSubCategoryByCatId() {

		setResultMap(suprSubCategoryList.getSubCategoryListByCategoryId(sutbCategoryId));
		subCategories = (List<SutbSubCategory>) getResultMap().get("pRESULTSET_ROWS");

		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));

		return SUCCESS;
	}

	public String getSutbCategoryId() {
		return sutbCategoryId;
	}

	public void setSutbCategoryId(String sutbCategoryId) {
		this.sutbCategoryId = sutbCategoryId;
	}

	public List<SutbSubCategory> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<SutbSubCategory> subCategories) {
		this.subCategories = subCategories;
	}

	/****************************************************************************************************************/

	private String sutbSubCategoryId, memberId, updateTxt, hoursSpent;

	public String processScrumUpdate() {

		setResultMap(suprScrumUpdateAdd.addScrumUpdate(General.getUUID(), sutbReportDetailId,
				sutbCategoryId, sutbSubCategoryId, memberId, updateTxt, hoursSpent));

		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));

		return SUCCESS;
	}

	public SuprReportDetailList getSuprReportDetailList() {
		return suprReportDetailList;
	}

	public void setSuprReportDetailList(SuprReportDetailList suprReportDetailList) {
		this.suprReportDetailList = suprReportDetailList;
	}

	public SuprCategoryFindByReportId getSuprCategoryList() {
		return suprCategoryList;
	}

	public void setSuprCategoryList(SuprCategoryFindByReportId suprCategoryList) {
		this.suprCategoryList = suprCategoryList;
	}

	public String getSutbSubCategoryId() {
		return sutbSubCategoryId;
	}

	public void setSutbSubCategoryId(String sutbSubCategoryId) {
		this.sutbSubCategoryId = sutbSubCategoryId;
	}

	public String getUpdateTxt() {
		return updateTxt;
	}

	public void setUpdateTxt(String updateTxt) {
		this.updateTxt = updateTxt;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getHoursSpent() {
		return hoursSpent;
	}

	public void setHoursSpent(String hoursSpent) {
		this.hoursSpent = hoursSpent;
	}

	public String finalReport() {

		setResultMap(suprReportDetailList.getReportList());
		sutbReportDetails = (List<SutbReportDetail>) getResultMap().get("pRESULTSET_ROWS");

		return SUCCESS;
	}

	public String getSrcumUpdatesListByReportId() {

		LOGGER.info("Ajax is fired and the value submitted is: " + sutbReportDetailId);

		setResultMap(suprFinalReportByReportId.getUpdatesList(sutbReportDetailId));
		sutbScrumUpdates = (List<SutbScrumUpdate>) getResultMap().get("pRESULTSET_ROWS");

		return SUCCESS;
	}

	private String sutbScrumUpdateId;

	public String deleteScrumUpdate() {

		setResultMap(suprScrumUpdateDelete.deleteScrumUpdate(sutbScrumUpdateId));

		return SUCCESS;
	}

	public String getSutbScrumUpdateId() {
		return sutbScrumUpdateId;
	}

	public void setSutbScrumUpdateId(String sutbScrumUpdateId) {
		this.sutbScrumUpdateId = sutbScrumUpdateId;
	}

}
