// ------------------------------------------------------------ //
//  text.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Text] widget that supports
/// **fluent-style extensions** for easy text styling and composition.
///
/// Example:
/// ```dart
/// Text('Hello World')
///   .color(material.Colors.blue)
///   .size(18)
///   .weight(material.FontWeight.bold)
///   .align(material.TextAlign.center);
/// ```
class Text extends material.StatelessWidget {
  final String data;
  final material.TextStyle? _style;
  final material.TextAlign? _textAlign;
  final material.TextDirection? _textDirection;
  final bool? _softWrap;
  final material.TextOverflow? _overflow;
  final material.TextScaler? _textScaleFactor;
  final int? _maxLines;
  final String? _semanticsLabel;

  /// Creates a declarative [Text] widget.
  const Text(
    this.data, {
    super.key,
    material.TextStyle? style,
    material.TextAlign? textAlign,
    material.TextDirection? textDirection,
    bool? softWrap,
    material.TextOverflow? overflow,
    material.TextScaler? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
  })  : _style = style,
        _textAlign = textAlign,
        _textDirection = textDirection,
        _softWrap = softWrap,
        _overflow = overflow,
        _textScaleFactor = textScaleFactor,
        _maxLines = maxLines,
        _semanticsLabel = semanticsLabel;

  /// Immutable copy helper for chaining.
  Text _copyWith({
    material.TextStyle? style,
    material.TextAlign? textAlign,
    material.TextDirection? textDirection,
    bool? softWrap,
    material.TextOverflow? overflow,
    material.TextScaler? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
  }) {
    return Text(
      data,
      key: key,
      style: style ?? _style,
      textAlign: textAlign ?? _textAlign,
      textDirection: textDirection ?? _textDirection,
      softWrap: softWrap ?? _softWrap,
      overflow: overflow ?? _overflow,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      maxLines: maxLines ?? _maxLines,
      semanticsLabel: semanticsLabel ?? _semanticsLabel,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Text(
      data,
      key: key,
      style: _style,
      textAlign: _textAlign,
      textDirection: _textDirection,
      softWrap: _softWrap,
      overflow: _overflow,
      textScaler: _textScaleFactor,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
    );
  }
}

// MARK: - Extension

/// Provides **chainable style modifiers** for the declarative [Text] widget.
///
/// These modifiers make text styling composable and expressive.
///
/// Example:
/// ```dart
/// Text('Declarative')
///   .color(material.Colors.red)
///   .size(20)
///   .weight(material.FontWeight.w600)
///   .italic()
///   .align(material.TextAlign.center);
/// ```
extension TextExtension on Text {
  /// Sets the text color.
  Text color(material.Color color) => _copyWith(
      style: (_style ?? const material.TextStyle()).copyWith(color: color));

  /// Sets the font size.
  Text size(double size) => _copyWith(
      style: (_style ?? const material.TextStyle()).copyWith(fontSize: size));

  /// Sets the font weight.
  Text weight(material.FontWeight weight) => _copyWith(
      style:
          (_style ?? const material.TextStyle()).copyWith(fontWeight: weight));

  /// Applies italic styling to the text.
  Text italic() => _copyWith(
      style: (_style ?? const material.TextStyle())
          .copyWith(fontStyle: material.FontStyle.italic));

  /// Applies underline decoration to the text.
  Text underline({material.Color? color, double? thickness}) => _copyWith(
        style: (_style ?? const material.TextStyle()).copyWith(
          decoration: material.TextDecoration.underline,
          decorationColor: color,
          decorationThickness: thickness,
        ),
      );

  /// Applies strikethrough decoration to the text.
  Text lineThrough({material.Color? color, double? thickness}) => _copyWith(
        style: (_style ?? const material.TextStyle()).copyWith(
          decoration: material.TextDecoration.lineThrough,
          decorationColor: color,
          decorationThickness: thickness,
        ),
      );

  /// Changes text alignment.
  Text align(material.TextAlign alignment) => _copyWith(textAlign: alignment);

  /// Limits text to a maximum number of lines.
  Text maxLines(int count) => _copyWith(maxLines: count);

  /// Sets how overflowing text is handled.
  Text overflow(material.TextOverflow overflow) =>
      _copyWith(overflow: overflow);

  /// Sets the text scale factor.
  Text scale(material.TextScaler factor) => _copyWith(textScaleFactor: factor);

  /// Sets whether text should wrap when reaching the end of a line.
  Text wrap(bool enabled) => _copyWith(softWrap: enabled);

  /// Sets letter spacing.
  Text letterSpacing(double spacing) => _copyWith(
      style: (_style ?? const material.TextStyle())
          .copyWith(letterSpacing: spacing));

  /// Sets line height (height multiplier).
  Text lineHeight(double height) => _copyWith(
      style: (_style ?? const material.TextStyle()).copyWith(height: height));

  /// Sets font family.
  Text font(String family) => _copyWith(
      style:
          (_style ?? const material.TextStyle()).copyWith(fontFamily: family));

  /// Sets a custom text direction.
  Text direction(material.TextDirection direction) =>
      _copyWith(textDirection: direction);
}
