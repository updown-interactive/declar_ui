// ------------------------------------------------------------ //
//  positioned.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Positioned] widget for use in a Stack,
/// supporting fluent-style chaining through extension methods.
class Positioned extends material.StatelessWidget {
  final material.Widget child;
  final double? _left;
  final double? _top;
  final double? _right;
  final double? _bottom;
  final double? _width;
  final double? _height;

  const Positioned({
    super.key,
    required this.child,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) : _left = left,
       _top = top,
       _right = right,
       _bottom = bottom,
       _width = width,
       _height = height;

  Positioned _copyWith({
    material.Widget? child,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    bool clearLeft = false,
    bool clearTop = false,
    bool clearRight = false,
    bool clearBottom = false,
    bool clearWidth = false,
    bool clearHeight = false,
  }) {
    return Positioned(
      key: key,
      child: child ?? this.child,
      left: clearLeft ? null : (left ?? _left),
      top: clearTop ? null : (top ?? _top),
      right: clearRight ? null : (right ?? _right),
      bottom: clearBottom ? null : (bottom ?? _bottom),
      width: clearWidth ? null : (width ?? _width),
      height: clearHeight ? null : (height ?? _height),
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Positioned(
      key: key,
      left: _left,
      top: _top,
      right: _right,
      width: _width,
      height: _height,
      child: child,
    );
  }
}

// MARK: - Extension

extension PositionedExtension on Positioned {
  Positioned left([double? value = 0.0]) =>
      _copyWith(left: value, clearLeft: value == null && _left != null);
  Positioned top([double? value = 0.0]) =>
      _copyWith(top: value, clearTop: value == null && _top != null);
  Positioned right([double? value = 0.0]) =>
      _copyWith(right: value, clearRight: value == null && _right != null);
  Positioned bottom([double? value = 0.0]) =>
      _copyWith(bottom: value, clearBottom: value == null && _bottom != null);

  Positioned width(double? value) =>
      _copyWith(width: value, clearWidth: value == null && _width != null);
  Positioned height(double? value) =>
      _copyWith(height: value, clearHeight: value == null && _height != null);

  Positioned edges({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) => _copyWith(left: left, top: top, right: right, bottom: bottom);

  Positioned fill({
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0,
  }) => _copyWith(left: left, top: top, right: right, bottom: bottom);
}
