package logger;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class FileLogger implements Logger {
	private String className;
	private LogLevel logLevel = LogLevel.INFO;
	private final FileWriter writer;
	private boolean logConsole;
	private Lock lock = new ReentrantLock();

	public FileLogger(String classname) throws IOException {
		this.className = classname;
		File file = new File(System.getProperty("user.dir") + "/app.txt");
		if (!file.exists()) {
			file.createNewFile();
		}
		this.writer = new FileWriter(file, true);

	}

	public FileLogger(String className, String filePath) throws IOException {
		this.className = className;
		File file = new File(filePath);
		if (!file.exists()) {
			file.createNewFile();
		}
		this.writer = new FileWriter(file, true);
	}

	public void close() throws IOException {
		if (writer != null) {
			writer.close();
		}
	}

	public void setConsoleLog(boolean flag) {
		this.logConsole = flag;
	}

	private synchronized void printMessage(String message, LogLevel logLevel) {
		lock.lock();
		String formattedLogMessage = MessageFormatter.formatMessage(message, this.className, logLevel);
		if (this.logConsole) {
			System.out.println(formattedLogMessage);
		}
		try {
			writer.write(formattedLogMessage + System.lineSeparator());
			writer.flush();
		} catch (IOException e) {
			System.err.println("Error writing to log file: " + e.getMessage());
		} finally {
			lock.unlock();
		}
	}

	private boolean shouldLog(LogLevel messageLevel) {
		return messageLevel.ordinal() >= this.logLevel.ordinal();
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
