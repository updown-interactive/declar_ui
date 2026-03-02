// ------------------------------------------------------------ //
//  stack.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Stack] widget that supports
/// **fluent-style extensions** for easy positioning and layout.
///
/// It mirrors Flutter’s [Stack] API but enables a more expressive,
/// composable syntax—similar to SwiftUI.
///
/// Example:
/// ```dart
/// Stack.children([
///   Container().size(width: 100, height: 100).backgroundColor(Colors.red),
///   Text('Top Left').topLeft(),
///   Text('Bottom Right').bottomRight(),
/// ])
///   .alignment(Alignment.center)
///   .fit(StackFit.expand);
/// ```
class Stack extends material.StatelessWidget {
  final List<material.Widget> _children;
  final material.AlignmentGeometry _alignment;
  final material.TextDirection? _textDirection;
  final material.StackFit _fit;
  final material.Clip _clipBehavior;

  /// Creates a customizable [Stack] widget.
  const Stack({
    super.key,
    List<material.Widget> children = const [],
    material.AlignmentGeometry alignment =
        material.AlignmentDirectional.topStart,
    material.TextDirection? textDirection,
    material.StackFit fit = material.StackFit.loose,
    material.Clip clipBehavior = material.Clip.hardEdge,
  })  : _children = children,
        _alignment = alignment,
        _textDirection = textDirection,
        _fit = fit,
        _clipBehavior = clipBehavior;

  const Stack.children(
    this._children, {
    super.key,
    material.AlignmentGeometry alignment =
        material.AlignmentDirectional.topStart,
    material.TextDirection? textDirection,
    material.StackFit fit = material.StackFit.loose,
    material.Clip clipBehavior = material.Clip.hardEdge,
  })  : _alignment = alignment,
        _textDirection = textDirection,
        _fit = fit,
        _clipBehavior = clipBehavior;

  /// Internal immutable copy helper for chaining.
  Stack _copyWith({
    List<material.Widget>? children,
    material.AlignmentGeometry? alignment,
    material.TextDirection? textDirection,
    material.StackFit? fit,
    material.Clip? clipBehavior,
  }) {
    return Stack(
      key: key,
      alignment: alignment ?? _alignment,
      textDirection: textDirection ?? _textDirection,
      fit: fit ?? _fit,
      clipBehavior: clipBehavior ?? _clipBehavior,
      children: children ?? _children,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Stack(
      key: key,
      alignment: _alignment,
      textDirection: _textDirection,
      fit: _fit,
      clipBehavior: _clipBehavior,
      children: _children,
    );
  }
}

// MARK: - Extension

/// Provides expressive, **chainable layout modifiers** for [Stack].
///
/// These modifiers allow you to control alignment, fitting, and clipping
/// without creating boilerplate layout code.
///
/// Example:
/// ```dart
/// Stack([...])
///   .alignment(Alignment.bottomCenter)
///   .fit(StackFit.expand);
/// ```
extension StackExtension on Stack {
  /// Sets the [AlignmentGeometry] for positioning children within the stack.
  Stack alignment(material.AlignmentGeometry alignment) =>
      _copyWith(alignment: alignment);

  /// Sets the [StackFit] for how non-positioned children are sized.
  Stack fit(material.StackFit fit) => _copyWith(fit: fit);

  /// Sets the [Clip] behavior for the stack.
  Stack clip(material.Clip clipBehavior) =>
      _copyWith(clipBehavior: clipBehavior);

  /// Sets the [TextDirection] for the stack.
  Stack direction(material.TextDirection textDirection) =>
      _copyWith(textDirection: textDirection);

  /// Replaces the stack's children with a new list.
  Stack children(List<material.Widget> newChildren) =>
      _copyWith(children: newChildren);

  /// Appends new widgets to the existing children.
  Stack append(List<material.Widget> more) =>
      _copyWith(children: [..._children, ...more]);

  /// Prepends new widgets before the existing children.
  Stack prepend(List<material.Widget> more) =>
      _copyWith(children: [...more, ..._children]);

  /// Clears all children from the stack.
  Stack clear() => _copyWith(children: const []);

  /// Reverses the order of stack children.
  Stack reversed() => _copyWith(children: _children.reversed.toList());
}
