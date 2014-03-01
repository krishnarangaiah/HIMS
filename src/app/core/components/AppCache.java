package app.core.components;

import java.io.Serializable;

public class AppCache implements Serializable {

	private static final long serialVersionUID = 1L;

	private String appName;
	private String appTag;
	private String version;

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppTag() {
		return appTag;
	}

	public void setAppTag(String appTag) {
		this.appTag = appTag;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}
