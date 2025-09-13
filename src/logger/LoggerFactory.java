package logger;

import java.io.IOException;

public class LoggerFactory {

	public static Logger getLogger(String clazz, LoggerType loggerType) throws IOException {

		switch (loggerType) {
		case CONSOLE:
			return new ConsoleLogger(clazz);
		case FILE:
			return new FileLogger(clazz);
		default:
			return new ConsoleLogger(clazz);

		}

	}

}
