// ------------------------------------------------------------ //
//  row.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Row] widget that supports
/// **fluent-style chaining** through extension methods.
///
/// It mirrors Flutter’s [Row] API but enables a more expressive,
/// composable syntax—similar to SwiftUI.
///
/// Example:
/// ```dart
/// Row([
///   Icon(Icons.star),
///   Text('Rating'),
/// ])
///   .align(main: MainAxisAlignment.center)
///   .spacing(12)
///   .crossAlign(CrossAxisAlignment.start);
/// ```
class Row extends material.StatelessWidget {
  final List<material.Widget> _children;
  final material.MainAxisAlignment _mainAxisAlignment;
  final material.CrossAxisAlignment _crossAxisAlignment;
  final material.MainAxisSize _mainAxisSize;
  final material.TextDirection? _textDirection;
  final material.VerticalDirection _verticalDirection;
  final material.TextBaseline? _textBaseline;
  final double _spacing;

  /// Creates a customizable [Row] widget.
  const Row(
    this._children, {
    super.key,
    material.MainAxisAlignment mainAxisAlignment =
        material.MainAxisAlignment.start,
    material.CrossAxisAlignment crossAxisAlignment =
        material.CrossAxisAlignment.center,
    material.MainAxisSize mainAxisSize = material.MainAxisSize.max,
    material.TextDirection? textDirection,
    material.VerticalDirection verticalDirection =
        material.VerticalDirection.down,
    material.TextBaseline? textBaseline,
    double spacing = 0.0,
  })  : _mainAxisAlignment = mainAxisAlignment,
        _crossAxisAlignment = crossAxisAlignment,
        _mainAxisSize = mainAxisSize,
        _textDirection = textDirection,
        _verticalDirection = verticalDirection,
        _textBaseline = textBaseline,
        _spacing = spacing;

  // NOTE: Use the same private field name style as your other widgets.
  // Some codebases prefer `_verticalDirection` vs `_vertical_direction` — adjust to your style.
  // Here I will correct to the consistent `_verticalDirection` used earlier.
  // (If you paste into your project, keep field names consistent.)

  @override
  material.Widget build(material.BuildContext context) {
    return material.Row(
      key: key,
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisSize: _mainAxisSize,
      textDirection: _textDirection,
      verticalDirection: _verticalDirection,
      textBaseline: _textBaseline,
      spacing: _spacing,
      children: _children,
    );
  }

  /// Internal immutable copy helper.
  Row _copyWith({
    List<material.Widget>? children,
    material.MainAxisAlignment? mainAxisAlignment,
    material.CrossAxisAlignment? crossAxisAlignment,
    material.MainAxisSize? mainAxisSize,
    material.TextDirection? textDirection,
    material.VerticalDirection? verticalDirection,
    material.TextBaseline? textBaseline,
    double? spacing,
  }) {
    return Row(
      children ?? _children,
      key: key,
      mainAxisAlignment: mainAxisAlignment ?? _mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? _mainAxisSize,
      textDirection: textDirection ?? _textDirection,
      verticalDirection: verticalDirection ?? _verticalDirection,
      textBaseline: textBaseline ?? _textBaseline,
      spacing: spacing ?? _spacing,
    );
  }
}

// MARK: - Extension

/// Provides expressive, **chainable layout modifiers** for [Row].
///
/// These modifiers allow you to control alignment, spacing, order,
/// and sizing without creating boilerplate layout code.
///
/// Example:
/// ```dart
/// Row([Text('A'), Text('B')])
///   .mainAlign(MainAxisAlignment.spaceBetween)
///   .crossAlign(CrossAxisAlignment.center)
///   .expandedAll();
/// ```
extension RowExtension on Row {
  /// Updates both [MainAxisAlignment] and [CrossAxisAlignment] values.
  Row align({
    material.MainAxisAlignment? main,
    material.CrossAxisAlignment? cross,
  }) =>
      _copyWith(mainAxisAlignment: main, crossAxisAlignment: cross);

  /// Adds consistent horizontal spacing between children.
  Row spacing(double? spacing) => _copyWith(spacing: spacing ?? 0.0);

  /// Updates the [MainAxisSize] of the row.
  Row size(material.MainAxisSize? size) =>
      _copyWith(mainAxisSize: size ?? material.MainAxisSize.max);

  /// Updates the [CrossAxisAlignment] value.
  Row crossAlign(material.CrossAxisAlignment? cross) =>
      _copyWith(crossAxisAlignment: cross);

  /// Updates the [MainAxisAlignment] value.
  Row mainAlign(material.MainAxisAlignment? main) =>
      _copyWith(mainAxisAlignment: main);

  /// Reverses the order of the children in the row.
  Row reversed() => _copyWith(children: _children.reversed.toList());

  /// Wraps every child inside an [Expanded] widget.
  Row expandedAll() => _copyWith(
        children: _children.map((child) => material.Expanded(child: child)).toList(),
      );

  /// Wraps every child in a [Flexible] widget with configurable [flex] and [fit].
  Row flexibleAll({int flex = 1, material.FlexFit fit = material.FlexFit.loose}) =>
      _copyWith(
        children: _children
            .map((child) => material.Flexible(flex: flex, fit: fit, child: child))
            .toList(),
      );

  /// Retains only the first [count] children of the row.
  Row take(int count) => _copyWith(children: _children.take(count).toList());
}
