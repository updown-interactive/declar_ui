// ------------------------------------------------------------ //
//  sizedbox.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [SizedBox] widget that supports
/// **fluent-style extensions** for expressive UI layout.
///
/// This version is identical in functionality to [material.SizedBox],
/// but it works seamlessly with declarative extensions like `.width()`,
/// `.height()`, and `.expanded()`.
///
/// Example:
/// ```dart
/// SizedBox(Text('Hello')).size(width: 100, height: 50);
/// ```
class SizedBox extends material.StatelessWidget {
  final material.Widget? child;
  final double? _width;
  final double? _height;

  /// Creates a box with the given [width], [height], and optional [child].
  const SizedBox({
    super.key,
    this.child,
    double? width,
    double? height,
  })  : _width = width,
        _height = height;

  /// Creates a box that expands to fill all available space.
  const SizedBox.expand({super.key, this.child})
      : _width = double.infinity,
        _height = double.infinity;

  /// Creates a box that shrinks to zero size.
  const SizedBox.shrink({super.key, this.child})
      : _width = 0.0,
        _height = 0.0;

  /// Creates a box where both width and height are the same.
  const SizedBox.square({
    super.key,
    double? dimension,
    this.child,
  })  : _width = dimension,
        _height = dimension;

  /// Internal immutable copy helper for chainable modifiers.
  SizedBox _copyWith({
    double? width,
    double? height,
    material.Widget? child,
  }) {
    return SizedBox(
      key: key,
      width: width ?? _width,
      height: height ?? _height,
      child: child ?? this.child,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.SizedBox(
      key: key,
      width: _width,
      height: _height,
      child: child,
    );
  }
}

// MARK: - Extension

/// Provides **chainable extensions** for the declarative [SizedBox].
///
/// These extensions let you adjust width, height, or expansion behavior
/// fluently — ideal for composing layouts cleanly and readably.
///
/// Example:
/// ```dart
/// SizedBox(Text('Hello'))
///   .width(200)
///   .height(50)
///   .expanded(expandWidth: true);
/// ```
extension SizedBoxExtension on SizedBox {
  /// Updates both [width] and [height] values.
  SizedBox size({double? width, double? height}) =>
      _copyWith(width: width ?? _width, height: height ?? _height);

  /// Updates only the width of the box.
  SizedBox width(double? width) => _copyWith(width: width ?? _width);

  /// Updates only the height of the box.
  SizedBox height(double? height) => _copyWith(height: height ?? _height);

  /// Expands the box horizontally, vertically, or both.
  ///
  /// Parameters:
  /// - [expandWidth]: If `true`, width becomes infinite.
  /// - [expandHeight]: If `true`, height becomes infinite.
  SizedBox expanded({bool expandWidth = false, bool expandHeight = false}) =>
      _copyWith(
        width: expandWidth ? double.infinity : _width,
        height: expandHeight ? double.infinity : _height,
      );

  /// Expands the box to take up all available horizontal space.
  SizedBox maxWidth() => _copyWith(width: double.infinity);

  /// Expands the box to take up all available vertical space.
  SizedBox maxHeight() => _copyWith(height: double.infinity);

  /// Shrinks the box to zero width and height.
  SizedBox shrink() => _copyWith(width: 0, height: 0);

  /// Makes the box a perfect square.
  SizedBox square(double dimension) =>
      _copyWith(width: dimension, height: dimension);
}
