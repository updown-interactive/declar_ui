// ------------------------------------------------------------ //
//  column.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [material.Column] widget.
///
/// This widget enables a **SwiftUI-like, composable API** for building
/// vertical layouts by allowing configuration through immutable,
/// chainable modifiers.
///
/// Instead of mutating properties, layout changes are expressed by
/// returning new instances of [Column].
///
/// ### Example
/// ```dart
/// Column([
///   Text('Hello'),
///   Text('World'),
/// ])
///   .spacing(12)
///   .align(
///     main: MainAxisAlignment.center,
///     cross: CrossAxisAlignment.start,
///   )
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

  /// Creates a declarative [Column] widget.
  ///
  /// All parameters mirror those of Flutter’s [material.Column], with the
  /// addition of [spacing], which inserts consistent vertical space between
  /// children (available in Flutter 3.24 and later).
  ///
  /// If not specified, default values match Flutter’s standard [Column]
  /// behavior.
  ///
  /// ### Example
  /// ```dart
  /// Column(
  ///   [
  ///     Text('Item 1'),
  ///     Text('Item 2'),
  ///   ],
  ///   spacing: 8,
  /// );
  /// ```
  /// or
  /// ```dart
  /// Column(
  ///   [
  ///     Text('Item 1'),
  ///     Text('Item 2'),
  ///   ],
  /// ).spacing(8);
  /// ```
  ///
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

  /// Creates an immutable copy of this [Column] with updated values.
  ///
  /// This method is used internally by extension modifiers to support
  /// a declarative, chainable configuration style without mutating state.
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

// MARK: - Column Modifiers

/// Extension methods that provide expressive, chainable layout modifiers
/// for the declarative [Column] widget.
///
/// Each modifier returns a **new [Column] instance**, enabling an
/// immutable, SwiftUI-style configuration pattern.
///
/// ### Example
/// ```dart
/// Column([Text('A'), Text('B')])
///   .spacing(8)
///   .mainAlign(MainAxisAlignment.center)
///   .expandedAll();
/// ```
extension ColumnExtension on Column {
  /// Updates both the [material.MainAxisAlignment] and
  /// [material.CrossAxisAlignment] of the column.
  Column align({
    material.MainAxisAlignment? main,
    material.CrossAxisAlignment? cross,
  }) =>
      _copyWith(mainAxisAlignment: main, crossAxisAlignment: cross);

  /// Sets the vertical spacing between children.
  ///
  /// Uses Flutter’s native `spacing` parameter (Flutter 3.24+).
  Column spacing(double? spacing) => _copyWith(spacing: spacing ?? 0.0);

  /// Sets the [material.MainAxisSize] of the column.
  Column size(material.MainAxisSize? size) =>
      _copyWith(mainAxisSize: size ?? material.MainAxisSize.max);

  /// Updates only the [material.CrossAxisAlignment].
  Column crossAlign(material.CrossAxisAlignment? cross) =>
      _copyWith(crossAxisAlignment: cross);

  /// Updates only the [material.MainAxisAlignment].
  Column mainAlign(material.MainAxisAlignment? main) =>
      _copyWith(mainAxisAlignment: main);

  /// Reverses the order of the column’s children.
  Column reversed() => _copyWith(children: _children.reversed.toList());

  /// Wraps every child in an [material.Expanded] widget.
  ///
  /// Useful when all children should equally share available vertical space.
  Column expandedAll() => _copyWith(
        children:
            _children.map((child) => material.Expanded(child: child)).toList(),
      );

  /// Wraps every child in a [material.Flexible] widget.
  ///
  /// Allows customization of the [flex] factor and [material.FlexFit].
  Column flexibleAll({
    int flex = 1,
    material.FlexFit fit = material.FlexFit.loose,
  }) =>
      _copyWith(
        children: _children
            .map(
              (child) => material.Flexible(flex: flex, fit: fit, child: child),
            )
            .toList(),
      );

  /// Keeps only the first [count] children of the column.
  Column take(int count) => _copyWith(children: _children.take(count).toList());
}
