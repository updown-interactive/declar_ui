// ------------------------------------------------------------ //
//  num+extension.dart
// ------------------------------------------------------------ //

import 'dart:async';

extension DeclarativeNumExtension on num {
  // MARK: - Time / Durations

  /// Creates a [Duration] in milliseconds.
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Creates a [Duration] in seconds.
  Duration get seconds => Duration(seconds: toInt());

  /// Creates a [Duration] in minutes.
  Duration get minutes => Duration(minutes: toInt());

  /// Delays execution by this number of duration (assumes seconds if used immediately, but returns Future).
  ///
  /// Example:
  /// ```dart
  /// await 2.seconds.delay();
  /// ```
  Future<void> delay([FutureOr<void> Function()? callback]) async {
    return Future.delayed(
      Duration(milliseconds: (this * 1000).toInt()),
      callback,
    );
  }
}

extension DeclarativeDurationExtension on Duration {
  /// Delays for the specified duration and optionally executes a callback.
  Future<void> delay([FutureOr<void> Function()? callback]) async =>
      Future.delayed(this, callback);
}
