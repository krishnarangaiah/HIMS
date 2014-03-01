package app.db.model.master;

import java.io.Serializable;

public class TktbEnvironment implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tktbEnvironmentId;
	private String environment;
	private String actSts;

	public String getTktbEnvironmentId() {
		return tktbEnvironmentId;
	}

	public void setTktbEnvironmentId(String tktbEnvironmentId) {
		this.tktbEnvironmentId = tktbEnvironmentId;
	}

	public String getEnvironment() {
		return environment;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

}