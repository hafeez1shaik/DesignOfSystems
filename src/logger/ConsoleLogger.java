package logger;

public class ConsoleLogger implements Logger {

	private String className;
	private LogLevel logLevel = LogLevel.INFO;

	public ConsoleLogger(String className) {
		this.className = className;
	}

	private void printMessage(String message, LogLevel logLevel) {
		System.out.println(MessageFormatter.formatMessage(message, this.className, logLevel));
	}

	private boolean shouldLog(LogLevel logLevel) {
		switch (this.logLevel) {
		case INFO:
			return true;
		case WARN:
			return true;
		case ERROR:
			return logLevel == LogLevel.ERROR;
		default:
			return false;
		}
	}

	private void log(String message, LogLevel messageLevel) {
		if (shouldLog(messageLevel)) {
			printMessage(message, messageLevel);
		}
	}

	@Override
	public void info(String message) {
		log(message, LogLevel.INFO);
	}

	@Override
	public void debug(String message) {
		log(message, LogLevel.DEBUG);
	}

	@Override
	public void error(String message) {
		log(message, LogLevel.ERROR);
	}

	@Override
	public void warn(String message) {
		log(message, LogLevel.WARN);
	}

	@Override
	public void setLogLevel(LogLevel level) {
		this.logLevel = level;
	}

}
