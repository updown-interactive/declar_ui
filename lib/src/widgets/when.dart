// ------------------------------------------------------------ //
//  when.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative conditional widget that renders its child only when
/// a given [condition] is true — similar to SwiftUI’s `if` view builder.
///
/// This makes conditional rendering more composable and readable:
///
/// Example:
/// ```dart
/// When(condition: isLoggedIn)
///   .then(
///     Container(Text('Welcome back!'))
///       .backgroundColor(Colors.green)
///   )
///   .otherwise(
///     Container(Text('Please log in'))
///       .backgroundColor(Colors.red)
///   );
/// ```
///
/// Works perfectly with other Declar UI widgets and modifiers.
class When extends material.StatelessWidget {
  final bool _condition;
  final material.Widget? _thenChild;
  final material.Widget? _elseChild;

  /// Creates a conditional [When] widget.
  const When({
    super.key,
    required bool condition,
    material.Widget? then,
    material.Widget? otherwise,
  })  : _condition = condition,
        _thenChild = then,
        _elseChild = otherwise;

  /// Internal immutable copy helper for chaining.
  When _copyWith({
    bool? condition,
    material.Widget? then,
    material.Widget? otherwise,
  }) {
    return When(
      key: key,
      condition: condition ?? _condition,
      then: then ?? _thenChild,
      otherwise: otherwise ?? _elseChild,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    if (_condition) {
      return _thenChild ?? const material.SizedBox.shrink();
    } else {
      return _elseChild ?? const material.SizedBox.shrink();
    }
  }
}

// MARK: - Extension

/// Provides fluent, composable syntax for the [When] widget.
///
/// Example:
/// ```dart
/// When(condition: isDarkMode)
///   .then(Container(Text('Dark Mode')))
///   .otherwise(Container(Text('Light Mode')));
/// ```
extension WhenExtension on When {
  /// Defines the widget to render when the condition is true.
  When then(material.Widget child) => _copyWith(then: child);

  /// Defines the widget to render when the condition is false.
  When otherwise(material.Widget child) => _copyWith(otherwise: child);

  /// Toggles the condition dynamically (useful in reactive cases).
  When toggle() => _copyWith(condition: !_condition);

  /// Inverts the current condition — syntactic sugar for `!condition`.
  When not() => _copyWith(condition: !_condition);
}
