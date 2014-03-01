package app.test;

import app.jade.agents.TestAgentA;
import app.jade.agents.TestAgentB;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;

public class Boot {

	private static Runtime runtime;
	private static Profile profile = new ProfileImpl();
	private static String jadeHost = "localhost";
	private static String jadePort = "1099";

	public static void main() {
		runtime = Runtime.instance();

		profile.setParameter(Profile.MAIN, "true");
		profile.setParameter(Profile.MAIN_HOST, jadeHost);
		profile.setParameter(Profile.MAIN_PORT, jadePort);
		profile.setParameter(Profile.CONTAINER_NAME, "Main-Container");
		jade.wrapper.AgentContainer mainContainer = runtime.createMainContainer(profile);

		try {
			mainContainer.start();

			AgentController testAgentA = mainContainer.acceptNewAgent("TestAgentA", new TestAgentA());
			testAgentA.start();
			
			AgentController testAgentB = mainContainer.acceptNewAgent("TestAgentB", new TestAgentB());
			testAgentB.start();
			
			AgentController rma = mainContainer.acceptNewAgent("rma", new jade.tools.rma.rma());
			rma.start();
		} catch (ControllerException e) {
			e.printStackTrace();
		}

	}

}
