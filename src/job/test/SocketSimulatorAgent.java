package job.test;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

// import org.apache.log4j.Logger;



import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.TickerBehaviour;
import jade.lang.acl.ACLMessage;
import job.components.cutom.agents.Muesp2Agent;
import job.components.models.AgentProfile;

public class SocketSimulatorAgent extends Agent {

	private static final long serialVersionUID = 1L;
	// private static final Logger log =
	// Logger.getLogger(SocketSimulatorAgent.class);

	private ACLMessage sendMsg = new ACLMessage(ACLMessage.REQUEST);

	private AgentProfile agentProfile;
	private List<AgentProfile> agentProfiles;

	@Override
	protected void setup() {
		super.setup();
		sendMsg.addReceiver(new AID("WorkerSpawnerAgent", AID.ISLOCALNAME));
		addBehaviour(new SocketSimulatorBehaviour(this, 10000));
	}

	private class SocketSimulatorBehaviour extends TickerBehaviour {

		private static final long serialVersionUID = 1L;

		public SocketSimulatorBehaviour(Agent a, long period) {
			super(a, period);

		}

		private byte sequenceId = 1;

		@Override
		protected void onTick() {

			agentProfile = new AgentProfile();
			agentProfiles = new ArrayList<AgentProfile>();

			agentProfile.setAgencyName("Constant");
			agentProfile.setAgentName(String.valueOf(System.currentTimeMillis()));
			agentProfile.setBehaviourType(Muesp2Agent.TICKER_BEHAVIOUR);
			agentProfile.setSequenceInAcency(sequenceId);

			sequenceId++;

			agentProfiles.add(agentProfile);

			try {

				sendMsg.setContentObject((Serializable) agentProfiles);
				send(sendMsg);

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}

}
