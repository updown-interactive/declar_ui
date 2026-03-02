// ------------------------------------------------------------ //
//  iterable+extension.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart';

extension DeclarativeIterableExtension<T> on Iterable<T> {
  /// Provides the element and index to the mapping function.
  ///
  /// Example:
  /// ```dart
  /// ['A', 'B'].mapIndexed((index, item) => Text('$index: $item'))
  /// ```
  Iterable<R> mapIndexed<R>(R Function(int index, T element) action) sync* {
    var index = 0;
    for (final element in this) {
      yield action(index++, element);
    }
  }

  /// Find first element matching the condition or return null.
  ///
  /// Example:
  /// ```dart
  /// final firstAdmin = users.firstWhereOrNull((u) => u.isAdmin);
  /// ```
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Groups items in the iterable by a key.
  ///
  /// Example:
  /// ```dart
  /// final groupedMap = events.groupBy((e) => e.date);
  /// ```
  Map<K, List<T>> groupBy<K>(K Function(T element) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }
}

extension DeclarativeWidgetIterableExtension on Iterable<Widget> {
  /// Injects a separator widget between every element in a list of widgets.
  ///
  /// Example:
  /// ```dart
  /// Row([Text('A'), Text('B')].separated(SizedBox(width: 8)))
  /// ```
  List<Widget> separated(Widget separator) {
    final list = toList();
    if (list.isEmpty || list.length == 1) return list;

    final separatedList = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      separatedList.add(list[i]);
      if (i < list.length - 1) {
        separatedList.add(separator);
      }
    }
    return separatedList;
  }
}
