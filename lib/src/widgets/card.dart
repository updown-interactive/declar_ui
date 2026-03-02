// ------------------------------------------------------------ //
//  card.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Card] widget that supports
/// fluent-style chaining through extension methods.
class Card extends material.StatelessWidget {
  final material.Widget? child;
  final material.Color? _color;
  final material.Color? _shadowColor;
  final material.Color? _surfaceTintColor;
  final double? _elevation;
  final material.ShapeBorder? _shape;
  final material.EdgeInsetsGeometry? _margin;
  final material.Clip? _clipBehavior;

  const Card({
    super.key,
    this.child,
    material.Color? color,
    material.Color? shadowColor,
    material.Color? surfaceTintColor,
    double? elevation,
    material.ShapeBorder? shape,
    material.EdgeInsetsGeometry? margin,
    material.Clip? clipBehavior,
  })  : _color = color,
        _shadowColor = shadowColor,
        _surfaceTintColor = surfaceTintColor,
        _elevation = elevation,
        _shape = shape,
        _margin = margin,
        _clipBehavior = clipBehavior;

  Card _copyWith({
    material.Widget? child,
    material.Color? color,
    material.Color? shadowColor,
    material.Color? surfaceTintColor,
    double? elevation,
    material.ShapeBorder? shape,
    material.EdgeInsetsGeometry? margin,
    material.Clip? clipBehavior,
  }) {
    return Card(
      key: key,
      child: child ?? this.child,
      color: color ?? _color,
      shadowColor: shadowColor ?? _shadowColor,
      surfaceTintColor: surfaceTintColor ?? _surfaceTintColor,
      elevation: elevation ?? _elevation,
      shape: shape ?? _shape,
      margin: margin ?? _margin,
      clipBehavior: clipBehavior ?? _clipBehavior,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Card(
      key: key,
      color: _color,
      shadowColor: _shadowColor,
      surfaceTintColor: _surfaceTintColor,
      elevation: _elevation,
      shape: _shape,
      margin: _margin,
      clipBehavior: _clipBehavior,
      child: child,
    );
  }
}

// MARK: - Extension

extension CardExtension on Card {
  Card color(material.Color color) => _copyWith(color: color);
  Card shadowColor(material.Color color) => _copyWith(shadowColor: color);
  Card surfaceTintColor(material.Color color) =>
      _copyWith(surfaceTintColor: color);

  Card elevation(double elevation) => _copyWith(elevation: elevation);

  Card shape(material.ShapeBorder shape) => _copyWith(shape: shape);
  Card rounded({double radius = 12.0}) => _copyWith(
      shape: material.RoundedRectangleBorder(
          borderRadius: material.BorderRadius.circular(radius)));

  Card margin(material.EdgeInsetsGeometry margin) => _copyWith(margin: margin);
  Card marginAll(double margin) =>
      _copyWith(margin: material.EdgeInsets.all(margin));
  Card marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      _copyWith(
          margin: material.EdgeInsets.symmetric(
              horizontal: horizontal, vertical: vertical));

  Card clip(material.Clip clipBehavior) =>
      _copyWith(clipBehavior: clipBehavior);
}
