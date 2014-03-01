package job.init;

import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;
import job.platform.agents.WorkerSpawnerAgent;
import job.test.SocketSimulatorAgent;

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
		profile.setParameter(Profile.CONTAINER_NAME, "Agent-Container");
		jade.wrapper.AgentContainer mainContainer = runtime.createMainContainer(profile);

		try {
			mainContainer.start();

			AgentController testAgent = mainContainer.acceptNewAgent("TestAgent", new SocketSimulatorAgent());
			testAgent.start();

			AgentController workerSpawnerAgent = mainContainer.acceptNewAgent("WorkerSpawnerAgent", new WorkerSpawnerAgent());
			workerSpawnerAgent.start();

			AgentController rma = mainContainer.acceptNewAgent("rma", new jade.tools.rma.rma());
			rma.start();

		} catch (ControllerException ce) {
			ce.printStackTrace();
		}
	}
}