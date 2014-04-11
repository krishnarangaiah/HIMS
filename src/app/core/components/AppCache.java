/** ********************************************************************************************************************************************* *
 * 	@author 		Krishna
 *  @project 		HIMS
 *  @createdOn 		11-April-2014
 *  @description 	This is the core Component that holds all the basic details of the Application and is an singleton Object
 *  				This Object is populated where the App is getting initialized
 *  ********************************************************************************************************************************************* */

package app.core.components;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

public class AppCache implements Serializable {

	private static final long serialVersionUID = 1L;
	private static AppCache appCache;

	private String appName;
	private String appTag;
	private String version;
	private List<String> workingWeekDays;

	/**
	 * Made constructor private to give singleton object
	 */
	private AppCache() {
	}

	/**
	 * Method for populating Application cash
	 */
	private void populateAppCache() {
		// This should come from DB

		appName = "HIMS";
		appTag = "0.0.1";
		version = "0.0.1";
		workingWeekDays = new ArrayList<String>() {
			private static final long serialVersionUID = 1L;
			{
				add("MON");
				add("TUE");
				add("WED");
				add("THU");
				add("FRI");
				add("SAT");
			}
		};

	}



	/**
	 * Singleton method
	 * 
	 * @return
	 */
	public static AppCache getInstance() {
		if (appCache == null) {
			appCache = new AppCache();
		}

		return appCache;
	}

	// Accessories
	public String getAppName() {
		return appName;
	}

	public String getAppTag() {
		return appTag;
	}

	public String getVersion() {
		return version;
	}

	public List<String> getWorkingWeekDays() {
		return workingWeekDays;
	}

}
