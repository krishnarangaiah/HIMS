package framework.core.custom.log4j.logger.levels;

import org.apache.log4j.Level;

import framework.core.app.modules.AppModuleVocabilary;

public class AppLevel extends Level implements AppModuleVocabilary {

	private static final long serialVersionUID = 1L;

	public static final int APP_DEBUG_INT = DEFAULT + DEBUG_INT + 1;
	public static final int APP_INFO_INT = DEFAULT + INFO_INT + 1;
	public static final int APP_ERROR_INT = DEFAULT + ERROR_INT + 1;
	public static final int APP_FATAL_INT = DEFAULT + FATAL_INT + 1;

	public static final int APP_SETUP_DEBUG_INT = SETUP + DEBUG_INT + 1;
	public static final int APP_SETUP_INFO_INT = SETUP + INFO_INT + 1;
	public static final int APP_SETUP_ERROR_INT = SETUP + ERROR_INT + 1;
	public static final int APP_SETUP_FATAL_INT = SETUP + FATAL_INT + 1;

	public static final int APP_INIT_DEBUG_INT = INIT + DEBUG_INT + 1;
	public static final int APP_INIT_INFO_INT = INIT + INFO_INT + 1;
	public static final int APP_INIT_ERROR_INT = INIT + ERROR_INT + 1;
	public static final int APP_INIT_FATAL_INT = INIT + FATAL_INT + 1;

	public static final int APP_UM_DEBUG_INT = UM + DEBUG_INT + 1;
	public static final int APP_UM_INFO_INT = UM + INFO_INT + 1;
	public static final int APP_UM_ERROR_INT = UM + ERROR_INT + 1;
	public static final int APP_UM_FATAL_INT = UM + FATAL_INT + 1;

	protected AppLevel(int level, String levelStr, int syslogEquivalent) {
		super(level, levelStr, syslogEquivalent);
	}

	public static final Level APP_DEBUG = new AppLevel(APP_DEBUG_INT, "APP_DEBUG -> ", 7);
	public static final Level APP_INFO = new AppLevel(APP_INFO_INT, "APP_INFO -> ", 7);
	public static final Level APP_ERROR = new AppLevel(APP_ERROR_INT, "APP_ERROR -> ", 7);
	public static final Level APP_FATAL = new AppLevel(APP_FATAL_INT, "APP_FATAL -> ", 7);

	public static final Level APP_SETUP_DEBUG = new AppLevel(APP_SETUP_DEBUG_INT, "APP_SETUP_DEBUG -> ", 7);
	public static final Level APP_SETUP_INFO = new AppLevel(APP_SETUP_INFO_INT, "APP_SETUP_INFO -> ", 7);
	public static final Level APP_SETUP_ERROR = new AppLevel(APP_SETUP_ERROR_INT, "APP_SETUP_ERROR -> ", 7);
	public static final Level APP_SETUP_FATAL = new AppLevel(APP_SETUP_FATAL_INT, "APP_SETUP_FATAL -> ", 7);

	public static final Level APP_INIT_DEBUG = new AppLevel(APP_INIT_DEBUG_INT, "APP_INIT_DEBUG -> ", 7);
	public static final Level APP_INIT_INFO = new AppLevel(APP_INIT_INFO_INT, "APP_INIT_INFO -> ", 7);
	public static final Level APP_INIT_ERROR = new AppLevel(APP_INIT_ERROR_INT, "APP_INIT_ERROR -> ", 7);
	public static final Level APP_INIT_FATAL = new AppLevel(APP_INIT_FATAL_INT, "APP_INIT_FATAL -> ", 7);

	public static final Level APP_UM_DEBUG = new AppLevel(APP_UM_DEBUG_INT, "APP_UM_DEBUG -> ", 7);
	public static final Level APP_UM_INFO = new AppLevel(APP_UM_INFO_INT, "APP_UM_INFO -> ", 7);
	public static final Level APP_UM_ERROR = new AppLevel(APP_UM_ERROR_INT, "APP_UM_ERROR -> ", 7);
	public static final Level APP_UM_FATAL = new AppLevel(APP_UM_FATAL_INT, "APP_UM_FATAL -> ", 7);

	public static void main(String[] args) {
		System.out.println(APP_INFO_INT + " = " + APP_UM_INFO_INT);
	}

}
