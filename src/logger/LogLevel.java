package logger;

public enum LogLevel {
    ERROR(3),
    WARN(2),
    INFO(1),
    DEBUG(0);

    private final int value;

    LogLevel(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static LogLevel levelOf(int value) {
        for (LogLevel level : LogLevel.values()) {
            if (level.value == value) {
                return level;
            }
        }
        return null;
    }
}
