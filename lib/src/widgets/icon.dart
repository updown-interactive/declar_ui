// ------------------------------------------------------------ //
//  icon.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Icon] widget that supports
/// **fluent-style extensions** for easy customization.
///
/// Enables expressive, chainable syntax for icon styling — similar
/// to SwiftUI or Jetpack Compose.
///
/// Example:
/// ```dart
/// Icon(Icons.favorite)
///   .color(material.Colors.red)
///   .size(32)
///   .semantic('Favorite icon');
/// ```
class Icon extends material.StatelessWidget {
  final material.IconData _icon;
  final material.Color? _color;
  final double? _size;
  final String? _semanticLabel;
  final material.TextDirection? _textDirection;
  final List<material.Shadow>? _shadows;
  final material.AlignmentGeometry? _alignment;

  /// Creates a declarative [Icon] widget.
  ///
  /// Example:
  /// ```dart
  /// Icon(material.Icons.star, color: material.Colors.amber, size: 24);
  /// ```
  const Icon(
    this._icon, {
    super.key,
    material.Color? color,
    double? size,
    String? semanticLabel,
    material.TextDirection? textDirection,
    List<material.Shadow>? shadows,
    material.AlignmentGeometry? alignment,
  })  : _color = color,
        _size = size,
        _semanticLabel = semanticLabel,
        _textDirection = textDirection,
        _shadows = shadows,
        _alignment = alignment;

  /// Immutable copy helper for fluent chaining.
  Icon _copyWith({
    material.Color? color,
    double? size,
    String? semanticLabel,
    material.TextDirection? textDirection,
    List<material.Shadow>? shadows,
    material.AlignmentGeometry? alignment,
  }) {
    return Icon(
      _icon,
      key: key,
      color: color ?? _color,
      size: size ?? _size,
      semanticLabel: semanticLabel ?? _semanticLabel,
      textDirection: textDirection ?? _textDirection,
      shadows: shadows ?? _shadows,
      alignment: alignment ?? _alignment,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    final iconWidget = material.Icon(
      _icon,
      key: key,
      color: _color,
      size: _size,
      semanticLabel: _semanticLabel,
      textDirection: _textDirection,
      shadows: _shadows,
    );

    // Apply alignment if specified
    if (_alignment != null) {
      return material.Align(
        alignment: _alignment!,
        child: iconWidget,
      );
    }

    return iconWidget;
  }
}

// MARK: - Extension

/// Provides **chainable style modifiers** for the declarative [Icon] widget.
///
/// Example:
/// ```dart
/// Icon(Icons.home)
///   .color(Colors.blue)
///   .size(28)
///   .align(Alignment.centerRight);
/// ```
extension IconExtension on Icon {
  /// Sets the icon color.
  Icon color(material.Color color) => _copyWith(color: color);

  /// Sets the icon size.
  Icon size(double size) => _copyWith(size: size);

  /// Adds a semantic label for accessibility.
  Icon semantic(String label) => _copyWith(semanticLabel: label);

  /// Adds drop shadows to the icon.
  ///
  /// Example:
  /// ```dart
  /// Icon(Icons.favorite).shadow([
  ///   Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.black26)
  /// ]);
  /// ```
  Icon shadow(List<material.Shadow> shadows) => _copyWith(shadows: shadows);

  /// Aligns the icon within a parent container.
  ///
  /// Example:
  /// ```dart
  /// Icon(Icons.star).align(Alignment.bottomCenter);
  /// ```
  Icon align(material.AlignmentGeometry alignment) =>
      _copyWith(alignment: alignment);

  /// Sets the [TextDirection] for the icon (useful for RTL layouts).
  Icon direction(material.TextDirection direction) =>
      _copyWith(textDirection: direction);
}
