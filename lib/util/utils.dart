import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 75,
    colors: true,
    printEmojis: true,
    noBoxingByDefault: false,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);

enum Level { debug, info, warning, error, wtf }

void logDebug(String message, {Level level = Level.info}) {
  if (kDebugMode) {
    switch (level) {
      case Level.debug:
        log.d(message);
        break;
      case Level.info:
        log.i(message);
        break;
      case Level.warning:
        log.w(message);
        break;
      case Level.error:
        log.e(message);
        break;
      default:
        log.d(message);
    }
  }
}
