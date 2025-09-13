package discountcalculation;

public class DiscountLogger {

	public enum Level {
		INFO, ERROR, DEBUG
	}

	public static void log(String message, Level level) {
		System.out.println("[" + level.name() + "] - " + message);
	}

	public static void logLineWithHeader(String message) {
		System.out.println("===================" + message + "===================");
	}
}
