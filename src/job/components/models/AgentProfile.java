package job.components.models;

/** ****************************************************************************************** *
 * 	Author			:	Krishna Rangaiah. k
 * 	Date Created	:	10, Aug, 2013
 * 	Project			:	Muesp2 [POC]
 * 	Description		:	Every Agent should belong to an Agency and should 
 * 						implement certain properties
 ** ****************************************************************************************** */

import java.util.List;

public class AgentProfile extends AgencyProfile {
	private static final long serialVersionUID = 1L;

	private String agentName;
	private byte sequenceInAcency;

	private List<String> receivers;

	private String scriptToLoad;
	private String functionToExecute;

	private boolean scalable;

	private byte behaviourType;

	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public byte getSequenceInAcency() {
		return sequenceInAcency;
	}

	public void setSequenceInAcency(byte sequenceInAcency) {
		this.sequenceInAcency = sequenceInAcency;
	}

	public List<String> getReceivers() {
		return receivers;
	}

	public void setReceivers(List<String> receivers) {
		this.receivers = receivers;
	}

	public String getScriptToLoad() {
		return scriptToLoad;
	}

	public void setScriptToLoad(String scriptToLoad) {
		this.scriptToLoad = scriptToLoad;
	}

	public String getFunctionToExecute() {
		return functionToExecute;
	}

	public void setFunctionToExecute(String functionToExecute) {
		this.functionToExecute = functionToExecute;
	}

	public boolean isScalable() {
		return scalable;
	}

	public void setScalable(boolean scalable) {
		this.scalable = scalable;
	}

	public byte getBehaviourType() {
		return behaviourType;
	}

	public void setBehaviourType(byte behaviourType) {
		this.behaviourType = behaviourType;
	}

}
