package app.jade.agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.TickerBehaviour;
import jade.lang.acl.ACLMessage;

public class TestAgentA extends Agent {

	private static final long serialVersionUID = 1L;

	private ACLMessage sendMessage = new ACLMessage(ACLMessage.INFORM);

	@Override
	protected void setup() {
		super.setup();
		sendMessage.addReceiver(new AID("TestAgentB", AID.ISLOCALNAME));
		addBehaviour(new TestBehaviourA(this, 2000));
	}

	private class TestBehaviourA extends TickerBehaviour {

		private static final long serialVersionUID = 1L;

		public TestBehaviourA(Agent a, long period) {
			super(a, period);

		}

		@Override
		protected void onTick() {
			sendMessage.setContent(String.valueOf(System.currentTimeMillis()));
			myAgent.send(sendMessage);
		}

	}

}
