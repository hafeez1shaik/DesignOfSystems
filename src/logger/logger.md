📝 Requirements for Logger Framework

You need to design and implement a simple logging library (like a lightweight version of log4j or slf4j).

Core Features

Log Levels: INFO, DEBUG, WARN, ERROR

User can set a global log level (e.g., only WARN and above should print).

Messages below the set level are ignored.

Message Format
Each log line should include:



Output Destinations (Strategies)

Console Logger (prints to System.out)

File Logger (writes to a file, e.g., app.log)

Extensibility

Should be easy to add new loggers (like DB logger, Remote logger) without modifying core code → use Strategy + Factory patterns.

Thread-Safe

Multiple threads should be able to log without garbling output.

🎯 Stretch Goals (if you finish quickly)

Async logging (queue + worker thread).

Log rotation (if file exceeds size, create a new one).

⚡ Your Mission:

Build Logger interface + implementations (ConsoleLogger, FileLogger).

Implement LoggerFactory.

Support different log levels.

Make it clean, extensible, and close to production-ready (aim for 9/10 quality!).

https://app.diagrams.net/#G17CYslciE1vifT8aULWwdOYfWXe0D6Rhc#%7B%22pageId%22%3A%22yjXlgCksxssnhnIZFY7_%22%7D