// ------------------------------------------------------------ //
//  column.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Column] widget that supports
/// composable syntax—similar to SwiftUI.
///
/// It allows you to express layout logic in a more **readable, SwiftUI-like** way.
///
/// Example:
/// ```dart
/// Column([
///   Text('Hello'),
///   Text('World'),
/// ])
///   .align(main: MainAxisAlignment.center, cross: CrossAxisAlignment.start)
///   .spacing(12)
///   .expandedAll();
/// ```
class Column extends material.StatelessWidget {
  final List<material.Widget> _children;
  final material.MainAxisAlignment _mainAxisAlignment;
  final material.CrossAxisAlignment _crossAxisAlignment;
  final material.MainAxisSize _mainAxisSize;
  final material.TextDirection? _textDirection;
  final material.VerticalDirection _verticalDirection;
  final material.TextBaseline? _textBaseline;
  final double _spacing;

  /// Creates a customizable [Column] widget.
  ///
  /// Parameters:
  /// - [mainAxisAlignment]: Defines how children are aligned vertically.
  /// - [crossAxisAlignment]: Defines horizontal alignment.
  /// - [mainAxisSize]: Controls whether the column takes minimum or maximum height.
  /// - [spacing]: Adds consistent spacing between children (requires Flutter 3.24+).
  ///
  /// Example:
  /// ```dart
  /// Column([
  ///   Text('Item 1'),
  ///   Text('Item 2'),
  /// ], spacing: 8);
  /// ```
  const Column(
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

  /// Internal immutable copy helper.
  Column _copyWith({
    List<material.Widget>? children,
    material.MainAxisAlignment? mainAxisAlignment,
    material.CrossAxisAlignment? crossAxisAlignment,
    material.MainAxisSize? mainAxisSize,
    material.TextDirection? textDirection,
    material.VerticalDirection? verticalDirection,
    material.TextBaseline? textBaseline,
    double? spacing,
  }) {
    return Column(
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

  @override
  material.Widget build(material.BuildContext context) {
    return material.Column(
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
}

// MARK: - Extension

/// Provides expressive and chainable layout modifiers for [Column].
///
/// These extension methods mirror Flutter layout APIs like alignment,
/// spacing, and sizing — but in a declarative, composable way.
///
/// Example:
/// ```dart
/// Column([Text('A'), Text('B')])
///   .spacing(8)
///   .align(main: MainAxisAlignment.center)
///   .expandedAll();
/// ```
extension ColumnExtension on Column {
  /// Updates both [MainAxisAlignment] and [CrossAxisAlignment] values.
  Column align({
    material.MainAxisAlignment? main,
    material.CrossAxisAlignment? cross,
  }) =>
      _copyWith(mainAxisAlignment: main, crossAxisAlignment: cross);

  /// Sets the vertical spacing between children.
  ///
  /// Works in Flutter 3.24 and later using the `spacing` parameter.
  Column spacing(double? spacing) => _copyWith(spacing: spacing ?? 0.0);

  /// Sets the [MainAxisSize] for the column.
  Column size(material.MainAxisSize? size) =>
      _copyWith(mainAxisSize: size ?? material.MainAxisSize.max);

  /// Updates only the [CrossAxisAlignment] value.
  Column crossAlign(material.CrossAxisAlignment? cross) =>
      _copyWith(crossAxisAlignment: cross);

  /// Updates only the [MainAxisAlignment] value.
  Column mainAlign(material.MainAxisAlignment? main) =>
      _copyWith(mainAxisAlignment: main);

  /// Reverses the order of children in the column.
  Column reversed() => _copyWith(children: _children.reversed.toList());

  /// Wraps every child in an [Expanded] widget.
  Column expandedAll() => _copyWith(
        children: _children.map((child) => material.Expanded(child: child)).toList(),
      );

  /// Wraps every child in a [Flexible] widget with configurable [flex] and [fit].
  Column flexibleAll({int flex = 1, material.FlexFit fit = material.FlexFit.loose}) =>
      _copyWith(
        children: _children
            .map((child) => material.Flexible(flex: flex, fit: fit, child: child))
            .toList(),
      );

  /// Keeps only the first [count] children of the column.
  Column take(int count) =>
      _copyWith(children: _children.take(count).toList());
}
