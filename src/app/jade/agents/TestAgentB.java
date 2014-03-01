package app.jade.agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.TickerBehaviour;
import jade.lang.acl.ACLMessage;

public class TestAgentB extends Agent {

	private static final long serialVersionUID = 1L;

	// private ACLMessage sendMessage = new ACLMessage(ACLMessage.INFORM);
	private ACLMessage receiveMessage = new ACLMessage(ACLMessage.INFORM);

	@Override
	protected void setup() {
		super.setup();
		addBehaviour(new TestBehaviourB(this));
	}

	private class TestBehaviourB extends CyclicBehaviour {

		private static final long serialVersionUID = 1L;

		public TestBehaviourB(Agent agent) {
			super(agent);
		}

		@Override
		public void action() {
			receiveMessage = receive();

			if (null != receiveMessage) {
				System.out.println(receiveMessage.getContent());
			} else {
				block();
			}

		}

	}

}
