package job.platform.agents;

import java.util.List;

import org.apache.log4j.Logger;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.UnreadableException;
import jade.wrapper.StaleProxyException;
import job.components.models.AgentProfile;

public class WorkerSpawnerAgent extends Agent {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(WorkerSpawnerAgent.class);

	private ACLMessage receiveMsg = new ACLMessage(ACLMessage.REQUEST);
	private List<AgentProfile> agentProfiles;

	@Override
	protected void setup() {
		super.setup();
		addBehaviour(new WorkerSpawnerBehaviour());
	}

	private class WorkerSpawnerBehaviour extends CyclicBehaviour {

		private static final long serialVersionUID = 1L;

		@SuppressWarnings("unchecked")
		@Override
		public void action() {

			receiveMsg = receive();

			if (receiveMsg != null) {

				try {
					agentProfiles = (List<AgentProfile>) receiveMsg.getContentObject();

					for (AgentProfile agentProfile : agentProfiles) {
						getContainerController().acceptNewAgent(agentProfile.getAgentName(), new WorkerAgent(agentProfile)).start();
					}

				} catch (UnreadableException e) {
					log.error(e);
				} catch (StaleProxyException e) {
					e.printStackTrace();
				}

			} else {
				block();
			}
		}

	}

}
