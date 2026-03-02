// ------------------------------------------------------------ //
//  safe_area.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [SafeArea] widget that supports
/// fluent-style chaining through extension methods.
class SafeArea extends material.StatelessWidget {
  final material.Widget child;
  final bool _left;
  final bool _top;
  final bool _right;
  final bool _bottom;
  final material.EdgeInsets _minimum;
  final bool _maintainBottomViewPadding;

  const SafeArea({
    super.key,
    required this.child,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    material.EdgeInsets minimum = material.EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) : _left = left,
       _top = top,
       _right = right,
       _bottom = bottom,
       _minimum = minimum,
       _maintainBottomViewPadding = maintainBottomViewPadding;

  SafeArea _copyWith({
    material.Widget? child,
    bool? left,
    bool? top,
    bool? right,
    bool? bottom,
    material.EdgeInsets? minimum,
    bool? maintainBottomViewPadding,
  }) {
    return SafeArea(
      key: key,
      child: child ?? this.child,
      left: left ?? _left,
      top: top ?? _top,
      right: right ?? _right,
      bottom: bottom ?? _bottom,
      minimum: minimum ?? _minimum,
      maintainBottomViewPadding:
          maintainBottomViewPadding ?? _maintainBottomViewPadding,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.SafeArea(
      key: key,
      left: _left,
      top: _top,
      right: _right,
      minimum: _minimum,
      maintainBottomViewPadding: _maintainBottomViewPadding,
      child: child,
    );
  }
}

// MARK: - Extension

extension SafeAreaExtension on SafeArea {
  SafeArea left(bool value) => _copyWith(left: value);
  SafeArea top(bool value) => _copyWith(top: value);
  SafeArea right(bool value) => _copyWith(right: value);
  SafeArea bottom(bool value) => _copyWith(bottom: value);

  SafeArea edges({bool? left, bool? top, bool? right, bool? bottom}) =>
      _copyWith(
        left: left ?? _left,
        top: top ?? _top,
        right: right ?? _right,
        bottom: bottom ?? _bottom,
      );

  SafeArea all() => _copyWith(left: true, top: true, right: true, bottom: true);
  SafeArea none() =>
      _copyWith(left: false, top: false, right: false, bottom: false);

  SafeArea minimum(material.EdgeInsets minimum) => _copyWith(minimum: minimum);
  SafeArea maintainBottomViewPadding(bool value) =>
      _copyWith(maintainBottomViewPadding: value);
}
