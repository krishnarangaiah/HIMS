package app.actions.session.on.manager;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import app.db.dao.user.ApprRoleList;
import app.db.dao.user.ApprUserAdd;
import app.db.dao.user.ApprUserDelete;
import app.db.dao.user.ApprUserFindById;
import app.db.dao.user.ApprUserUpdate;
import app.db.dao.user.AptbUserList;
import app.db.model.user.AptbRole;
import app.db.model.user.AptbUser;
import framework.core.setup.app.action.extentions.ActionExtension;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class ManagerActions extends ActionExtension implements DataAccessVocabilary {

	private static final long serialVersionUID = 1L;

	// Logger
	private static final Logger LOGGER = Logger.getLogger(ManagerActions.class);

	// Data access layer
	private static BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(
			new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

	// DAO beans
	private AptbUserList aptbUserList = (AptbUserList) factory.getBean("aptbUserList");
	private ApprRoleList apprRoleList = (ApprRoleList) factory.getBean("apprRoleList");
	private ApprUserAdd apprUserAdd = (ApprUserAdd) factory.getBean("apprUserAdd");
	private ApprUserDelete apprUserDelete = (ApprUserDelete) factory.getBean("apprUserDelete");
	private ApprUserFindById apprUserFindById = (ApprUserFindById) factory
			.getBean("apprUserFindById");
	private ApprUserUpdate apprUserUpdate = (ApprUserUpdate) factory.getBean("apprUserUpdate");

	/***********************************************************************************************************************/
	private List<AptbUser> aptbUsers = new ArrayList<AptbUser>();

	/**
	 * Method to get User List
	 * 
	 * @return
	 */
	public String getUserList() {

		setResultMap(aptbUserList.getUserList());
		aptbUsers = (List<AptbUser>) getResultMap().get("pRESULTSET_ROWS");

		return SUCCESS;
	}

	public List<AptbUser> getAptbUsers() {
		return aptbUsers;
	}

	public void setAptbUsers(List<AptbUser> aptbUsers) {
		this.aptbUsers = aptbUsers;
	}

	/***********************************************************************************************************************/
	private List<AptbRole> aptbRoles = new ArrayList<AptbRole>();

	/**
	 * Method to get Role List
	 * 
	 * @return
	 */
	public String getUserRoleList() {

		setResultMap(apprRoleList.getRoleList());
		aptbRoles = (List<AptbRole>) getResultMap().get("pRESULTSET_ROWS");

		return SUCCESS;
	}

	public List<AptbRole> getAptbRoles() {
		return aptbRoles;
	}

	public void setAptbRoles(List<AptbRole> aptbRoles) {
		this.aptbRoles = aptbRoles;
	}

	/***********************************************************************************************************************/
	private String aptbUserId, userName, userPassword, fullName, mobileNo, emailId, createdBy,
			microMngmt, feedbackReq, aptbRoleId;

	/**
	 * Method to process Add user
	 * 
	 * @return
	 */
	public String processAddUser() {

		setResultMap(apprUserAdd.addUser(userName, userPassword, fullName, mobileNo, emailId,
				createdBy, microMngmt, feedbackReq, aptbRoleId));
		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));
		setErrorMessage((String) getResultMap().get("pOUT_ERROR_MSG"));

		return SUCCESS;
	}

	public String getAptbUserId() {
		return aptbUserId;
	}

	public void setAptbUserId(String aptbUserId) {
		this.aptbUserId = aptbUserId;
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

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getAptbRoleId() {
		return aptbRoleId;
	}

	public void setAptbRoleId(String aptbRoleId) {
		this.aptbRoleId = aptbRoleId;
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

	/***********************************************************************************************************************/
	/**
	 * Method to delete an user
	 * 
	 * @return
	 */
	public String deleteUser() {

		setResultMap(apprUserDelete.deleteUser(aptbUserId,
				((AptbUser) getSession().get("SESSION_USER")).getAptbUserId()));
		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));
		setErrorMessage((String) getResultMap().get("pOUT_ERROR_MSG"));

		return SUCCESS;
	}

	/**
	 * Method to get User Details
	 * 
	 * @return
	 */
	public String getUserDetail() {

		setResultMap(apprUserFindById.getDetails(aptbUserId));
		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));
		setErrorMessage((String) getResultMap().get("pOUT_ERROR_MSG"));

		if (!((List<AptbUser>) getResultMap().get("pRESULTSET_ROWS")).isEmpty()) {
			List<AptbUser> aptbUsers = (List<AptbUser>) getResultMap().get("pRESULTSET_ROWS");

			for (AptbUser aptbUser : aptbUsers) {

				aptbUserId = aptbUser.getAptbUserId();
				userName = aptbUser.getUserName();
				userPassword = aptbUser.getUserPassword();
				fullName = aptbUser.getFullName();
				mobileNo = aptbUser.getMobileNo();
				emailId = aptbUser.getEmailId();
				createdBy = aptbUser.getCreatedBy();
				microMngmt = aptbUser.getMicroMngmt();
				feedbackReq = aptbUser.getFeedbackReq();
				aptbRoleId = aptbUser.getAptbRole().getAptbRoleId();
				actSts = aptbUser.getActSts();

				getUserRoleList();

				break;
			}

		}

		return SUCCESS;
	}

	private String actSts, updatedBy;

	public String processEditUser() {

		setResultMap(apprUserUpdate.editUser(aptbUserId, userName, userPassword, fullName,
				mobileNo, emailId, aptbRoleId, actSts, microMngmt, feedbackReq, updatedBy));
		setActionMessage((String) getResultMap().get("pOUT_ACTION_MSG"));
		setErrorMessage((String) getResultMap().get("pOUT_ERROR_MSG"));

		return SUCCESS;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

}
