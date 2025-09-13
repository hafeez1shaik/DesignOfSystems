package logger;

public interface Logger {

	void setLogLevel(LogLevel level);

	void info(String message);

	void debug(String message);

	void error(String message);

	void warn(String message);

}
