// ------------------------------------------------------------ //
//  wrap.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Wrap] widget that supports
/// fluent-style chaining through extension methods.
class Wrap extends material.StatelessWidget {
  final List<material.Widget> _children;
  final material.Axis _direction;
  final material.WrapAlignment _alignment;
  final double _spacing;
  final material.WrapAlignment _runAlignment;
  final double _runSpacing;
  final material.WrapCrossAlignment _crossAxisAlignment;
  final material.TextDirection? _textDirection;
  final material.VerticalDirection _verticalDirection;
  final material.Clip _clipBehavior;

  const Wrap({
    super.key,
    List<material.Widget> children = const [],
    material.Axis direction = material.Axis.horizontal,
    material.WrapAlignment alignment = material.WrapAlignment.start,
    double spacing = 0.0,
    material.WrapAlignment runAlignment = material.WrapAlignment.start,
    double runSpacing = 0.0,
    material.WrapCrossAlignment crossAxisAlignment =
        material.WrapCrossAlignment.start,
    material.TextDirection? textDirection,
    material.VerticalDirection verticalDirection =
        material.VerticalDirection.down,
    material.Clip clipBehavior = material.Clip.none,
  }) : _children = children,
       _direction = direction,
       _alignment = alignment,
       _spacing = spacing,
       _runAlignment = runAlignment,
       _runSpacing = runSpacing,
       _crossAxisAlignment = crossAxisAlignment,
       _textDirection = textDirection,
       _verticalDirection = verticalDirection,
       _clipBehavior = clipBehavior;

  const Wrap.children(
    List<material.Widget> children, {
    super.key,
    material.Axis direction = material.Axis.horizontal,
    material.WrapAlignment alignment = material.WrapAlignment.start,
    double spacing = 0.0,
    material.WrapAlignment runAlignment = material.WrapAlignment.start,
    double runSpacing = 0.0,
    material.WrapCrossAlignment crossAxisAlignment =
        material.WrapCrossAlignment.start,
    material.TextDirection? textDirection,
    material.VerticalDirection verticalDirection =
        material.VerticalDirection.down,
    material.Clip clipBehavior = material.Clip.none,
  }) : _children = children,
       _direction = direction,
       _alignment = alignment,
       _spacing = spacing,
       _runAlignment = runAlignment,
       _runSpacing = runSpacing,
       _crossAxisAlignment = crossAxisAlignment,
       _textDirection = textDirection,
       _verticalDirection = verticalDirection,
       _clipBehavior = clipBehavior;

  Wrap _copyWith({
    List<material.Widget>? children,
    material.Axis? direction,
    material.WrapAlignment? alignment,
    double? spacing,
    material.WrapAlignment? runAlignment,
    double? runSpacing,
    material.WrapCrossAlignment? crossAxisAlignment,
    material.TextDirection? textDirection,
    material.VerticalDirection? verticalDirection,
    material.Clip? clipBehavior,
  }) {
    return Wrap(
      key: key,
      direction: direction ?? _direction,
      alignment: alignment ?? _alignment,
      spacing: spacing ?? _spacing,
      runAlignment: runAlignment ?? _runAlignment,
      runSpacing: runSpacing ?? _runSpacing,
      crossAxisAlignment: crossAxisAlignment ?? _crossAxisAlignment,
      textDirection: textDirection ?? _textDirection,
      verticalDirection: verticalDirection ?? _verticalDirection,
      clipBehavior: clipBehavior ?? _clipBehavior,
      children: children ?? _children,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Wrap(
      key: key,
      direction: _direction,
      alignment: _alignment,
      spacing: _spacing,
      runAlignment: _runAlignment,
      runSpacing: _runSpacing,
      crossAxisAlignment: _crossAxisAlignment,
      textDirection: _textDirection,
      verticalDirection: _verticalDirection,
      clipBehavior: _clipBehavior,
      children: _children,
    );
  }
}

// MARK: - Extension

extension WrapExtension on Wrap {
  Wrap direction(material.Axis direction) => _copyWith(direction: direction);
  Wrap horizontal() => _copyWith(direction: material.Axis.horizontal);
  Wrap vertical() => _copyWith(direction: material.Axis.vertical);

  Wrap alignment(material.WrapAlignment alignment) =>
      _copyWith(alignment: alignment);
  Wrap spacing(double spacing) => _copyWith(spacing: spacing);

  Wrap runAlignment(material.WrapAlignment runAlignment) =>
      _copyWith(runAlignment: runAlignment);
  Wrap runSpacing(double runSpacing) => _copyWith(runSpacing: runSpacing);

  Wrap crossAlign(material.WrapCrossAlignment crossAxisAlignment) =>
      _copyWith(crossAxisAlignment: crossAxisAlignment);

  Wrap clip(material.Clip clipBehavior) =>
      _copyWith(clipBehavior: clipBehavior);

  Wrap children(List<material.Widget> newChildren) =>
      _copyWith(children: newChildren);
  Wrap append(List<material.Widget> more) =>
      _copyWith(children: [..._children, ...more]);
}
