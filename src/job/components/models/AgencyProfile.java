package job.components.models;

/** ****************************************************************************************** *
 * 	Author			:	Krishna Rangaiah. k
 * 	Date Created	:	10, Aug, 2013
 * 	Project			:	Muesp2 [POC]
 * 	Description		:	Every Agent should belong to an Agency and should 
 * 						implement certain properties
 ** ****************************************************************************************** */

import java.io.Serializable;

public abstract class AgencyProfile implements Serializable {
	private static final long serialVersionUID = 1L;

	// Agency name, should unique across the platform
	private String agencyName;

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

}
