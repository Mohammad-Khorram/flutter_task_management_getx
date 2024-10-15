import 'package:logger/logger.dart';

abstract class LogCore {
  void debug(message);

  void warning(message);

  void error(message);

  void fatal(message);

  void info(message);
}

class LogCoreImpl extends LogCore {
  final Logger logger = Logger();

  @override
  void debug(dynamic message) {
    Logger.level = Level.trace;
    logger.d(message);
  }

  @override
  void warning(dynamic message) {
    Logger.level = Level.warning;
    logger.w(message);
  }

  @override
  void error(dynamic message) {
    Logger.level = Level.error;
    logger.e(message);
  }

  @override
  void fatal(dynamic message) {
    Logger.level = Level.fatal;
    logger.f(message);
  }

  @override
  void info(dynamic message) {
    Logger.level = Level.info;
    logger.i(message);
  }
}
