import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart' as logging;

@injectable
class Logger {
  logging.Logger _logger = logging.Logger('');

  static void initialize([logging.Level level = logging.Level.ALL]) {
    logging.Logger.root.level = level;
    logging.Logger.root.onRecord.listen((logging.LogRecord rec) {
      dev.log(
        '${rec.level.name}: ${rec.time}: ${rec.message}',
        level: rec.level.value,
        name: rec.loggerName,
      );
    });
  }

  void logFor(Object toLog) {
    _logger = logging.Logger('${toLog.runtimeType}#${shortHash(toLog)}');
  }

  void info(Object message) {
    _logger.info(message);
  }

  void warning(Object message) {
    _logger.warning(message);
  }

  void severe(Object message) {
    _logger.severe(message);
  }
}
