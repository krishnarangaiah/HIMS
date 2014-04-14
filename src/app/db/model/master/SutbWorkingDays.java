package app.db.model.master;

import java.io.Serializable;

public class SutbWorkingDays implements Serializable {

	private static final long serialVersionUID = 1L;

	private String sutbWorkingDaysId;
	private String weekDay;

	public String getSutbWorkingDaysId() {
		return sutbWorkingDaysId;
	}

	public void setSutbWorkingDaysId(String sutbWorkingDaysId) {
		this.sutbWorkingDaysId = sutbWorkingDaysId;
	}

	public String getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}

}
