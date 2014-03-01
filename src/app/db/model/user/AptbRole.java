package app.db.model.user;

import java.io.Serializable;

public class AptbRole implements Serializable {

	private static final long serialVersionUID = 1L;

	private String aptbRoleId;
	private String role;
	private String diplayName;
	private String actSts;
	private String roleLevel;
	private String userMemt;

	public String getAptbRoleId() {
		return aptbRoleId;
	}

	public void setAptbRoleId(String aptbRoleId) {
		this.aptbRoleId = aptbRoleId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

	public void setDiplayName(String diplayName) {
		this.diplayName = diplayName;
	}

	public String getDiplayName() {
		return diplayName;
	}

	public String getRoleLevel() {
		return roleLevel;
	}

	public void setRoleLevel(String roleLevel) {
		this.roleLevel = roleLevel;
	}

	public String getUserMemt() {
		return userMemt;
	}

	public void setUserMemt(String userMemt) {
		this.userMemt = userMemt;
	}

}