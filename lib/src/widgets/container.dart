// ------------------------------------------------------------ //
//  container_extension.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:declar_ui/declar_ui.dart';
import 'package:flutter/material.dart' as material;

/// A declarative version of Flutter's [Container] widget that supports
/// composable syntax—similar to SwiftUI
///
/// The [Container] class wraps the Flutter [material.Container] widget
/// and provides the same functionality while allowing the use of custom
/// extensions to modify styling and layout more expressively.
///
/// Example:
/// ```dart
/// Container(Text('Hello'))
///   .backgroundColor(Colors.blue)
///   .contentPadding(all: 12)
///   .radius(all: 8)
///   .center();
/// ```
class Container extends material.StatelessWidget {
  final material.Widget? child;
  final double? _width;
  final double? _height;
  final material.EdgeInsetsGeometry? _padding;
  final material.EdgeInsetsGeometry? _margin;
  final material.Color? _color;
  final material.Decoration? _decoration;
  final material.Decoration? _foregroundDecoration;
  final material.BoxConstraints? _constraints;
  final material.Matrix4? _transform;
  final material.AlignmentGeometry? _alignment;
  final material.AlignmentGeometry? _transformAlignment;
  final material.Clip _clipBehavior;

  /// Creates a customizable [Container] widget similar to Flutter’s built-in [Container].
  ///
  /// You can define width, height, color, decoration, margin, padding, and more.
  const Container({
    super.key,
    this.child,
    double? width,
    double? height,
    material.EdgeInsetsGeometry? padding,
    material.EdgeInsetsGeometry? margin,
    material.Color? color,
    material.Decoration? decoration,
    material.Decoration? foregroundDecoration,
    material.BoxConstraints? constraints,
    material.Matrix4? transform,
    material.AlignmentGeometry? alignment,
    material.AlignmentGeometry? transformAlignment,
    material.Clip clipBehavior = material.Clip.none,
  })  : _width = width,
        _height = height,
        _padding = padding,
        _margin = margin,
        _color = color,
        _decoration = decoration,
        _foregroundDecoration = foregroundDecoration,
        _constraints = constraints,
        _transform = transform,
        _alignment = alignment,
        _transformAlignment = transformAlignment,
        _clipBehavior = clipBehavior;

 Container _copyWith({
  material.Widget? child,
  double? width,
  double? height,
  material.EdgeInsetsGeometry? padding,
  material.EdgeInsetsGeometry? margin,
  material.Color? color,
  material.Decoration? decoration,
  material.Decoration? foregroundDecoration,
  material.BoxConstraints? constraints,
  material.Matrix4? transform,
  material.AlignmentGeometry? alignment,
  material.AlignmentGeometry? transformAlignment,
  material.Clip? clipBehavior,
}) {
  return Container(
    key: key,
    width: width ?? _width,
    height: height ?? _height,
    padding: padding ?? _padding,
    margin: margin ?? _margin,
    color: color ?? _color,
    decoration: decoration ?? _decoration,
    foregroundDecoration: foregroundDecoration ?? _foregroundDecoration,
    constraints: constraints ?? _constraints,
    transform: transform ?? _transform,
    alignment: alignment ?? _alignment,
    transformAlignment: transformAlignment ?? _transformAlignment,
    clipBehavior: clipBehavior ?? _clipBehavior,
     child: child ?? this.child,
  );
}

  @override
  material.Widget build(material.BuildContext context) {
    return material.Container(
        key: key,
        width: _width,
        height: _height,
        padding: _padding,
        margin: _margin,
        color: _color,
        decoration: _decoration,
        foregroundDecoration: _foregroundDecoration,
        constraints: _constraints,
        transform: _transform,
        alignment: _alignment,
        clipBehavior: _clipBehavior,
        transformAlignment: _transformAlignment,
        child: child);
  }
}

/// An extension on [Container] that provides expressive, chainable styling
/// methods similar to SwiftUI’s modifier syntax.
///
/// Example:
/// ```dart
/// Container(Text('Hello'))
///   .backgroundColor(Colors.red)
///   .radius(all: 8)
///   .contentPadding(all: 10)
///   .bottomCenter();
/// ```
extension ContainerExtension on Container {
  /// Adds padding inside the container.
  ///
  /// You can specify `all`, `horizontal`, `vertical`, or individual sides.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Hello')).contentPadding(all: 16);
  /// ```
  Container contentPadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    final resolved = EdgeInsets.only(
      left: left ?? horizontal ?? all ?? 0,
      right: right ?? horizontal ?? all ?? 0,
      top: top ?? vertical ?? all ?? 0,
      bottom: bottom ?? vertical ?? all ?? 0,
    );

    return _copyWith(padding: resolved);
  }

  /// Sets a background color for the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Hello')).backgroundColor(Colors.blue);
  /// ```
  Container backgroundColor(Color value) {
    final decoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(color: value)
        : BoxDecoration(color: value);
        return _copyWith(decoration: decoration);
  }

  /// Adds margin outside the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Hello')).contentMargin(horizontal: 12, vertical: 8);
  /// ```
  Container contentMargin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    final resolved = EdgeInsets.only(
      left: left ?? horizontal ?? all ?? 0,
      right: right ?? horizontal ?? all ?? 0,
      top: top ?? vertical ?? all ?? 0,
      bottom: bottom ?? vertical ?? all ?? 0,
    );

    return _copyWith(margin: resolved);
  }

  /// Sets the minimum and maximum width and height for the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Constrained')).constrain(minWidth: 50, maxWidth: 200);
  /// ```
  Container constrain({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final newConstraints = material.BoxConstraints(
      minWidth: minWidth ?? _constraints?.minWidth ?? 0.0,
      maxWidth: maxWidth ?? _constraints?.maxWidth ?? double.infinity,
      minHeight: minHeight ?? _constraints?.minHeight ?? 0.0,
      maxHeight: maxHeight ?? _constraints?.maxHeight ?? double.infinity,
    );
    return _copyWith(constraints: newConstraints);
  }

  /// Sets the width of the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Wide')).width(200);
  /// ```
  Container width(double value) {
    return _copyWith(width: value);
  }

  /// Sets the height of the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Tall')).height(150);
  /// ```
  Container height(double value) {
    return _copyWith(height: value);
  }

  /// Applies a [BoxDecoration] to the container.
  ///
  /// This allows for complex decorations like gradients, borders, and shadows.
  /// If a color was previously set with `backgroundColor`, it will be
  /// overridden by the color in the `BoxDecoration`.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Gradient'))
  ///   .decorate(BoxDecoration(
  ///     gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
  ///     borderRadius: BorderRadius.circular(10),
  ///   ));
  ///     
  /// }

  /// Sets the width and height of the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Box')).size(width: 100, height: 50);
  /// ```
  Container size({double? width, double? height}) {
    return _copyWith(width: width, height: height);
  }

  /// Rounds the container’s corners using a border radius.
  ///
  /// You can specify individual corners or uniform rounding using `all`.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Rounded')).radius(all: 12);
  /// ```
  Container radius({
    double? all,
    double? horizontal,
    double? vertical,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final radius = BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? vertical ?? horizontal ?? all ?? 0),
      topRight: Radius.circular(topRight ?? vertical ?? horizontal ?? all ?? 0),
      bottomLeft:
          Radius.circular(bottomLeft ?? vertical ?? horizontal ?? all ?? 0),
      bottomRight:
          Radius.circular(bottomRight ?? vertical ?? horizontal ?? all ?? 0),
    );

    final newDecoration = (_decoration is BoxDecoration)
        // ignore: unnecessary_cast
        ? (_decoration as BoxDecoration).copyWith(borderRadius: radius)
        : BoxDecoration(color: _color, borderRadius: radius);
    return _copyWith(decoration: newDecoration);
    
  }

  /// Adds a border around the container with optional radius.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Bordered')).border(color: Colors.black, width: 2);
  /// ```
  Container border({
    Color color = Colors.black,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double? radius,
  }) {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(
            border: Border.all(color: color, width: width, style: style),
            borderRadius: radius != null
                ? BorderRadius.circular(radius)
                : (_decoration as BoxDecoration).borderRadius,
          )
        : BoxDecoration(
            color: _color,
            border: Border.all(color: color, width: width, style: style),
            borderRadius: radius != null ? BorderRadius.circular(radius) : null,
          );
    return _copyWith(decoration: newDecoration);
  }

  /// Centers the child widget within the container.
  Container center() => _withAlignment(Alignment.center);

  // Alignment shortcuts
  Container topLeft() => _withAlignment(Alignment.topLeft);
  Container topCenter() => _withAlignment(Alignment.topCenter);
  Container topRight() => _withAlignment(Alignment.topRight);
  Container centerLeft() => _withAlignment(Alignment.centerLeft);
  Container centerRight() => _withAlignment(Alignment.centerRight);
  Container bottomLeft() => _withAlignment(Alignment.bottomLeft);
  Container bottomCenter() => _withAlignment(Alignment.bottomCenter);
  Container bottomRight() => _withAlignment(Alignment.bottomRight);

  /// Aligns the container’s child with a custom [AlignmentGeometry].
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Custom')).align(Alignment(0.5, -0.5));
  /// ```
  Container align(AlignmentGeometry alignment) => _withAlignment(alignment);

  /// Private helper for applying alignment to a container.
  Container _withAlignment(AlignmentGeometry alignmentValue) {
    return _copyWith(alignment: alignmentValue);
  }
}
