// ------------------------------------------------------------ //
//  switch_case.dart
//
//  Created by Siva Sankar on 2025-11-13.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative alternative to `switch` for building conditional UIs.
///
/// Example:
/// ```dart
/// SwitchCase(value: userRole)
///   .caseOf('admin', Container(Text('Welcome Admin')))
///   .caseOf('user', Container(Text('Hello User')))
///   .otherwise(Container(Text('Access Denied')));
class SwitchCase<T> extends material.StatelessWidget {
  final T _value;
  final Map<T, material.Widget> _cases;
  final material.Widget? _defaultChild;

  const SwitchCase({
    super.key,
    required T value,
    Map<T, material.Widget>? cases,
    material.Widget? otherwise,
  })  : _value = value,
        _cases = cases ?? const {},
        _defaultChild = otherwise;

  /// Internal immutable copy for chaining.
  SwitchCase<T> _copyWith({
    T? value,
    Map<T, material.Widget>? cases,
    material.Widget? otherwise,
  }) {
    return SwitchCase<T>(
      key: key,
      value: value ?? _value,
      cases: cases ?? _cases,
      otherwise: otherwise ?? _defaultChild,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return _cases[_value] ?? _defaultChild ?? const material.SizedBox.shrink();
  }
}

// MARK: - Extension

extension SwitchCaseExtension<T> on SwitchCase<T> {
  /// Adds a case to the declarative switch.
  SwitchCase<T> caseOf(T match, material.Widget child) {
    final updatedCases = Map<T, material.Widget>.from(_cases);
    updatedCases[match] = child;
    return _copyWith(cases: updatedCases);
  }

  /// Defines the widget to render if no case matches.
  SwitchCase<T> otherwise(material.Widget child) {
    return _copyWith(otherwise: child);
  }
}
