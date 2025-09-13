package logger;

public class MessageFormatter {


	private MessageFormatter() {

	}

	public static String formatMessage(String message, String clazz, LogLevel logLevel) {
		return "["+java.time.LocalDateTime.now()+"] "+"["+logLevel.toString()+"] "+" ["+clazz+"] "+message;
	}

}
