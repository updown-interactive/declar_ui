// ------------------------------------------------------------ //
// container_extension.dart
//
// Created by Siva Sankar on 2025-11-11.
// Enhanced with additional features
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
/// methods similar to SwiftUI's modifier syntax.
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

  /// Sets the width and height of the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Box')).size(width: 100, height: 50);
  /// ```
  Container size({double? width, double? height}) {
    return _copyWith(width: width, height: height);
  }

  /// Sets a square size (same width and height).
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Square')).square(100);
  /// ```
  Container square(double size) {
    return _copyWith(width: size, height: size);
  }

  /// Applies a custom [BoxDecoration] to the container.
  ///
  /// This allows for complex decorations like gradients, borders, and shadows.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Gradient'))
  ///   .decoration(BoxDecoration(
  ///     gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
  ///     borderRadius: BorderRadius.circular(10),
  ///   ));
  /// ```
  Container decoration(material.BoxDecoration decoration) {
    return _copyWith(decoration: decoration);
  }

  /// Applies a foreground decoration to the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Overlay'))
  ///   .foregroundDecoration(BoxDecoration(
  ///     gradient: LinearGradient(
  ///       colors: [Colors.transparent, Colors.black54],
  ///     ),
  ///   ));
  /// ```
  Container foregroundDecoration(material.BoxDecoration decoration) {
    return _copyWith(foregroundDecoration: decoration);
  }

  /// Sets the container shape to a circle.
  ///
  /// Example:
  /// ```dart
  /// Container(Icon(Icons.star)).circle().size(width: 50, height: 50);
  /// ```
  Container circle() {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(shape: BoxShape.circle)
        : BoxDecoration(color: _color, shape: BoxShape.circle);
    return _copyWith(decoration: newDecoration);
  }

  /// Sets the container shape.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Shape')).shape(BoxShape.rectangle);
  /// ```
  Container shape(BoxShape shape) {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(shape: shape)
        : BoxDecoration(color: _color, shape: shape);
    return _copyWith(decoration: newDecoration);
  }

  /// Rounds the container's corners using a border radius.
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

  /// Adds individual borders to specific sides.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Custom Border'))
  ///   .borderSides(
  ///     top: BorderSide(color: Colors.red, width: 2),
  ///     bottom: BorderSide(color: Colors.blue, width: 2),
  ///   );
  /// ```
  Container borderSides({
    BorderSide? top,
    BorderSide? bottom,
    BorderSide? left,
    BorderSide? right,
  }) {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(
            border: Border(
              top: top ?? BorderSide.none,
              bottom: bottom ?? BorderSide.none,
              left: left ?? BorderSide.none,
              right: right ?? BorderSide.none,
            ),
          )
        : BoxDecoration(
            color: _color,
            border: Border(
              top: top ?? BorderSide.none,
              bottom: bottom ?? BorderSide.none,
              left: left ?? BorderSide.none,
              right: right ?? BorderSide.none,
            ),
          );
    return _copyWith(decoration: newDecoration);
  }

  /// Adds a shadow to the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Shadow'))
  ///   .shadow(
  ///     color: Colors.black26,
  ///     blurRadius: 8,
  ///     offset: Offset(2, 2),
  ///   );
  /// ```
  Container shadow({
    Color color = Colors.black26,
    double blurRadius = 4.0,
    Offset offset = Offset.zero,
    double spreadRadius = 0.0,
  }) {
    final shadow = BoxShadow(
      color: color,
      blurRadius: blurRadius,
      offset: offset,
      spreadRadius: spreadRadius,
    );

    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(
            boxShadow: [...?(_decoration as BoxDecoration).boxShadow, shadow],
          )
        : BoxDecoration(
            color: _color,
            boxShadow: [shadow],
          );
    return _copyWith(decoration: newDecoration);
  }

  /// Adds multiple shadows to the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Multi Shadow'))
  ///   .shadows([
  ///     BoxShadow(color: Colors.black12, blurRadius: 4),
  ///     BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(4, 4)),
  ///   ]);
  /// ```
  Container shadows(List<BoxShadow> shadows) {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(boxShadow: shadows)
        : BoxDecoration(color: _color, boxShadow: shadows);
    return _copyWith(decoration: newDecoration);
  }

  /// Applies a linear gradient background.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Gradient'))
  ///   .linearGradient(
  ///     colors: [Colors.red, Colors.blue],
  ///     begin: Alignment.topLeft,
  ///     end: Alignment.bottomRight,
  ///   );
  /// ```
  Container linearGradient({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
  }) {
    final gradient = LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: tileMode,
    );

    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(gradient: gradient)
        : BoxDecoration(gradient: gradient);
    return _copyWith(decoration: newDecoration);
  }

  /// Applies a radial gradient background.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Radial'))
  ///   .radialGradient(
  ///     colors: [Colors.white, Colors.blue],
  ///     center: Alignment.center,
  ///   );
  /// ```
  Container radialGradient({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
  }) {
    final gradient = RadialGradient(
      colors: colors,
      center: center,
      radius: radius,
      stops: stops,
      tileMode: tileMode,
    );

    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(gradient: gradient)
        : BoxDecoration(gradient: gradient);
    return _copyWith(decoration: newDecoration);
  }

  /// Applies a sweep gradient background.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Sweep'))
  ///   .sweepGradient(
  ///     colors: [Colors.red, Colors.blue, Colors.red],
  ///     center: Alignment.center,
  ///   );
  /// ```
  Container sweepGradient({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = 6.283185307179586, // 2 * pi
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
  }) {
    final gradient = SweepGradient(
      colors: colors,
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      stops: stops,
      tileMode: tileMode,
    );

    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(gradient: gradient)
        : BoxDecoration(gradient: gradient);
    return _copyWith(decoration: newDecoration);
  }

  /// Applies an image background.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Image'))
  ///   .backgroundImage(
  ///     image: NetworkImage('https://example.com/image.png'),
  ///     fit: BoxFit.cover,
  ///   );
  /// ```
  Container backgroundImage({
    required ImageProvider image,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    ColorFilter? colorFilter,
  }) {
    final newDecoration = (_decoration is BoxDecoration)
        ? (_decoration as BoxDecoration).copyWith(
            image: DecorationImage(
              image: image,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              colorFilter: colorFilter,
            ),
          )
        : BoxDecoration(
            color: _color,
            image: DecorationImage(
              image: image,
              fit: fit,
              alignment: alignment,
              repeat: repeat,
              colorFilter: colorFilter,
            ),
          );
    return _copyWith(decoration: newDecoration);
  }

  /// Sets the clip behavior of the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Image.network('...')).clip(Clip.hardEdge).radius(all: 12);
  /// ```
  Container clip(Clip clipBehavior) {
    return _copyWith(clipBehavior: clipBehavior);
  }

  /// Applies opacity to the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Faded')).opacity(0.5);
  /// ```
  material.Widget opacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }

  /// Rotates the container by the specified angle in radians.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Rotated')).rotate(0.1); // ~5.7 degrees
  /// ```
  Container rotate(double angle) {
    final transform = Matrix4.rotationZ(angle);
    return _copyWith(transform: transform);
  }

  /// Scales the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Scaled')).scale(1.5);
  /// ```
  Container scale(double scale) {
    final transform = Matrix4.identity()..scale(scale);
    return _copyWith(transform: transform);
  }

  /// Translates (moves) the container.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Moved')).translate(x: 10, y: 20);
  /// ```
  Container translate({double x = 0, double y = 0, double z = 0}) {
    final transform = Matrix4.translationValues(x, y, z);
    return _copyWith(transform: transform);
  }

  /// Applies a custom transformation matrix.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Custom')).transform(Matrix4.skewX(0.2));
  /// ```
  Container transform(Matrix4 matrix) {
    return _copyWith(transform: matrix);
  }

  /// Sets the transform alignment.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Pivot')).rotate(0.5).transformAlignment(Alignment.topLeft);
  /// ```
  Container transformAlignment(AlignmentGeometry alignment) {
    return _copyWith(transformAlignment: alignment);
  }

  // ========== Alignment Methods ==========

  /// Centers the child widget within the container.
  Container center() => _withAlignment(Alignment.center);

  Container topLeft() => _withAlignment(Alignment.topLeft);
  Container topCenter() => _withAlignment(Alignment.topCenter);
  Container topRight() => _withAlignment(Alignment.topRight);
  Container centerLeft() => _withAlignment(Alignment.centerLeft);
  Container centerRight() => _withAlignment(Alignment.centerRight);
  Container bottomLeft() => _withAlignment(Alignment.bottomLeft);
  Container bottomCenter() => _withAlignment(Alignment.bottomCenter);
  Container bottomRight() => _withAlignment(Alignment.bottomRight);

  /// Aligns the container's child with a custom [AlignmentGeometry].
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

  // ========== Utility Methods ==========

  /// Makes the container expand to fill available space.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Expanded')).expand();
  /// ```
  material.Widget expand({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Adds an aspect ratio constraint.
  ///
  /// Example:
  /// ```dart
  /// Container(Image.network('...')).aspectRatio(16 / 9);
  /// ```
  material.Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Wraps the container in a GestureDetector for tap interactions.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Tap me')).onTap(() => print('Tapped!'));
  /// ```
  material.Widget onTap(VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }

  /// Wraps the container in an InkWell for material ripple effects.
  ///
  /// Example:
  /// ```dart
  /// Container(Text('Ripple')).inkWell(onTap: () => print('Tapped!'));
  /// ```
  material.Widget inkWell({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    Color? splashColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: this,
    );
  }
}
