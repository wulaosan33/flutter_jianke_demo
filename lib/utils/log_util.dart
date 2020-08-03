import 'package:logger/logger.dart';

///日志工具类
class LogUtil {
  static Logger get() {
    var logger = Logger(
      printer: PrettyPrinter(
          methodCount: 1,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
    return logger;
  }
}
