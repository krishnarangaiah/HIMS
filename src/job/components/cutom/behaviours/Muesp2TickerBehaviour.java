package job.components.cutom.behaviours;

import jade.core.behaviours.TickerBehaviour;
import job.components.cutom.agents.Muesp2Agent;

import org.apache.log4j.Logger;

public class Muesp2TickerBehaviour extends TickerBehaviour {

	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(Muesp2TickerBehaviour.class);

	private Muesp2Agent agent;

	public Muesp2TickerBehaviour(Muesp2Agent agent, long period) {
		super(agent, period);
		this.agent = agent;
	}

	@Override
	protected void onTick() {
		log.info(agent.getAgentName() + " agent ia running and sequence is " + agent.getSequenceInAcency());
	}

}
