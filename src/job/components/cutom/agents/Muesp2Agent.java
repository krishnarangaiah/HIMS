package job.components.cutom.agents;

import java.util.List;

import org.apache.log4j.Logger;

import jade.core.AID;
import jade.core.Agent;
import jade.lang.acl.ACLMessage;
import job.components.cutom.agents.vocabilary.Muesp2AgentVocabilary;
import job.components.cutom.behaviours.Muesp2TickerBehaviour;
import job.components.models.AgentProfile;

public abstract class Muesp2Agent extends Agent implements Muesp2AgentVocabilary {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(Muesp2Agent.class);

	private String agentName;
	private byte behaviourType;
	private byte sequenceInAcency;

	private final ACLMessage sendAclMsg = new ACLMessage(ACLMessage.INFORM);
	private final ACLMessage receiveAclMsg = new ACLMessage(ACLMessage.INFORM);

	private List<String> receivers;

	private String scriptToLoad;
	private String functionToExecute;

	public Muesp2Agent(AgentProfile agentProfile) {

		super();
		setAgentProperties(agentProfile);
		log.info("Preparing Muesp2Agent Object with agent name " + agentName);

	}

	@Override
	protected final void setup() {

		super.setup();
		setReceivers();
		addBehaviour();

	}

	private void setAgentProperties(AgentProfile agentProfile) {

		agentName = agentProfile.getAgentName();
		sequenceInAcency = agentProfile.getSequenceInAcency();
		receivers = agentProfile.getReceivers();
		scriptToLoad = agentProfile.getScriptToLoad();
		functionToExecute = agentProfile.getFunctionToExecute();
		behaviourType = agentProfile.getBehaviourType();

	}

	private void setReceivers() {

		if (null != receivers) {
			for (String receiver : receivers) {
				sendAclMsg.addReceiver(new AID(receiver, AID.ISLOCALNAME));
			}
		}

	}

	private void addBehaviour() {
		switch (behaviourType) {
		case SIMPLE_BEHAVIOUR:
			addBehaviour(new Muesp2TickerBehaviour(this, 3000));
			break;

		case CYCLIC_BEHAVIOUR:
			addBehaviour(new Muesp2TickerBehaviour(this, 3000));
			break;

		case TICKER_BEHAVIOUR:
			addBehaviour(new Muesp2TickerBehaviour(this, 3000));
			break;

		default:
			break;
		}
	}
	
	
	public String getAgentName() {
		return agentName;
	}
	
	public byte getSequenceInAcency() {
		return sequenceInAcency;
	}

}
