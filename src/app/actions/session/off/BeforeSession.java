package app.actions.session.off;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import app.db.dao.master.TkprProductList;
import app.db.dao.user.Login;
import app.db.model.master.TktbProduct;
import app.db.model.user.AptbUser;
import framework.core.custom.log4j.logger.levels.AppLevel;
import framework.core.setup.app.action.extentions.ActionExtension;
import framework.core.setup.app.dataaccess.vocabilary.DataAccessVocabilary;

public class BeforeSession extends ActionExtension implements DataAccessVocabilary {

	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger.getLogger(BeforeSession.class);
	private static BeanFactory factory = (BeanFactory) (new ClassPathXmlApplicationContext(new String[] { "classpath:" + APPLICATION_CONTEX_XML }));

	private Login login = (Login) factory.getBean("login");
	private TkprProductList tkprProductList = (TkprProductList) factory.getBean("tkprProductList");
	private List<TktbProduct> tktbProducts;

	static {
		// com.gcliff.ind.muesp2.init.Boot.main();

	}

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public String appLanding() {
		LOGGER.log(AppLevel.APP_INFO, "Application is initiating");
		// System.out.println("This is from scala: " + Util.getUUID());
		return SUCCESS;
	}

	public String login() {
		LOGGER.log(AppLevel.APP_UM_DEBUG, "Opening login page");
		return SUCCESS;
	}

	private String userName, userPassword;
	private List<AptbUser> aptbUsers;

	/**
	 * 
	 * @return String
	 */
	public String processLogin() {

		try {
			LOGGER.log(AppLevel.APP_UM_DEBUG, "Processing user login action");
			LOGGER.log(AppLevel.APP_UM_INFO, "UserName: " + userName + " UserPassword: " + userPassword);

			setResultMap(login.login(userName));
			LOGGER.log(AppLevel.APP_UM_DEBUG, "Accessed database for login");
			aptbUsers = (List<AptbUser>) getResultMap().get("pRESULTSET_ROWS");

			if (!aptbUsers.isEmpty()) {

				if (aptbUsers.get(0).getUserPassword().equals(userPassword)) {
					getSession().put("SESSION_USER", aptbUsers.get(0));

					setActionMessage("Login is Successful");

					setResultMap(tkprProductList.getProductList());
					tktbProducts = (List<TktbProduct>) getResultMap().get("pRESULTSET_ROWS");

					getSession().put("TKTB_PRODUCTS", tktbProducts);

					return SUCCESS;
				} else {
					setErrorMessage("Password is Wrong");
					return APP_LOGIN;
				}
			} else {
				LOGGER.log(AppLevel.APP_UM_DEBUG, "No user found");
				setErrorMessage("User does not exists");
				return APP_LOGIN;
			}

		} catch (Exception exception) {
			LOGGER.log(AppLevel.APP_UM_ERROR, "Got exception \"" + exception.getMessage() + "\" while processing Login with UserName: " + userName
					+ " UserPassword: " + userPassword);
			exception.printStackTrace();
			return APP_LOGIN;
		}

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

}
