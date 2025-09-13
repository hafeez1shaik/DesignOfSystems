package logger;

import java.io.IOException;

public class LoggerDemo {
    public static void main(String[] args) throws IOException {
        // Step 1: Get a logger from the factory
        Logger logger = LoggerFactory.getLogger("app", LoggerType.CONSOLE);
        logger.setLogLevel(LogLevel.WARN);

        // Step 2: Log messages at different levels
        logger.info("Application started");
        logger.warn("WARN started");
        logger.debug("DEBUG started");
        logger.error("ERROR started");

        // Step 3: Switch to file logger
        Logger fileLogger = LoggerFactory.getLogger("app", LoggerType.FILE);
        fileLogger.setLogLevel(LogLevel.INFO);
        fileLogger.info("This will be logged to a file");
        fileLogger.error("File logging error example");
        fileLogger.debug("DEBUG started");
        fileLogger.error("ERROR started");
    }
}
