// ------------------------------------------------------------ //
//  group.dart
//
//  Created by Siva Sankar on 2025-12-xx.
// ------------------------------------------------------------ //

import 'package:declar_ui/declar_ui.dart';

///
/// Defines layout types for the [Group] widget.
///
/// These represent common UI layout patterns:
/// - [vertical]   → Arranges widgets from top to bottom.
/// - [horizontal] → Arranges widgets from left to right.
/// - [stack]      → Overlaps widgets on top of one another.
///
enum GroupLayoutType {
  vertical,
  horizontal,
  stack,
}

///
/// A high-level layout container that allows multiple widgets to be arranged
/// together while sharing common visual modifiers.
///
/// [Group] supports three layout modes:
/// - Vertical layout (similar to a column)
/// - Horizontal layout (similar to a row)
/// - Stacked layout (overlapping children)
///
/// Additionally, it supports:
/// - Padding
/// - Decoration (color, border, radius, etc.)
/// - Per-child frame constraints
/// - Shared alignment
/// - Spacing between items
/// - Overlays and background widgets
/// - Tap gesture handling
/// - Implicit animations
///
/// Example:
/// ```dart
/// Group([
///   Text("Item 1"),
///   Text("Item 2"),
/// ])
///   .makeVertical(main: MainAxisAlignment.center)
///   .padding(all: 16)
///   .backgroundColor(Colors.blue)
///   .cornerRadius(12)
///   .spacing(8);
/// ```
class Group extends StatelessWidget {
  final List<Widget> children;
  final GroupLayoutType layout;

  // Shared styling/modifier values applied to each child.
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final double? spacing;
  final double? frameWidth;
  final double? frameHeight;

  final Widget? overlay;
  final Widget? background;

  final VoidCallback? onTap;

  final Duration? animationDuration;
  final Curve? animationCurve;

  // Alignment options for vertical/horizontal layouts
  final MainAxisAlignment? rowMain;
  final CrossAxisAlignment? rowCross;

  final MainAxisAlignment? colMain;
  final CrossAxisAlignment? colCross;

  const Group(
    this.children, {
    super.key,
    this.layout = GroupLayoutType.vertical,
    this.padding,
    this.decoration,
    this.alignment,
    this.spacing,
    this.frameWidth,
    this.frameHeight,
    this.overlay,
    this.background,
    this.onTap,
    this.animationDuration,
    this.animationCurve,
    this.rowMain,
    this.rowCross,
    this.colMain,
    this.colCross,
  });

  /// Creates an updated copy of this [Group] instance with changed properties.
  Group _copyWith({
    GroupLayoutType? layout,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
    AlignmentGeometry? alignment,
    double? spacing,
    double? frameWidth,
    double? frameHeight,
    Widget? overlay,
    Widget? background,
    VoidCallback? onTap,
    Duration? animationDuration,
    Curve? animationCurve,
    MainAxisAlignment? rowMain,
    CrossAxisAlignment? rowCross,
    MainAxisAlignment? colMain,
    CrossAxisAlignment? colCross,
  }) {
    return Group(
      children,
      layout: layout ?? this.layout,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      alignment: alignment ?? this.alignment,
      spacing: spacing ?? this.spacing,
      frameWidth: frameWidth ?? this.frameWidth,
      frameHeight: frameHeight ?? this.frameHeight,
      overlay: overlay ?? this.overlay,
      background: background ?? this.background,
      onTap: onTap ?? this.onTap,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      rowMain: rowMain ?? this.rowMain,
      rowCross: rowCross ?? this.rowCross,
      colMain: colMain ?? this.colMain,
      colCross: colCross ?? this.colCross,
    );
  }

  /// Wraps each individual child with all shared modifiers applied.
  Widget _wrapChild(Widget child) {
    Widget result = AnimatedContainer(
      duration: animationDuration ?? Duration.zero,
      curve: animationCurve ?? Curves.linear,
      width: frameWidth,
      height: frameHeight,
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      child: child,
    );

    if (background != null) {
      result = Stack([background!, result]);
    }

    if (overlay != null) {
      result = Stack([result, overlay!]);
    }

    if (onTap != null) {
      result = GestureDetector(onTap: onTap, child: result);
    }

    return result;
  }

  /// Builds the layout based on the assigned [GroupLayoutType].
  @override
  Widget build(BuildContext context) {
    final wrapped = children.map(_wrapChild).toList();

    switch (layout) {
      case GroupLayoutType.horizontal:
        return Row(
          wrapped,
          mainAxisAlignment: rowMain ?? MainAxisAlignment.start,
          crossAxisAlignment: rowCross ?? CrossAxisAlignment.center,
        ).spacing(spacing);

      case GroupLayoutType.vertical:
        return Column(
          wrapped,
          mainAxisAlignment: colMain ?? MainAxisAlignment.start,
          crossAxisAlignment: colCross ?? CrossAxisAlignment.center,
        ).spacing(spacing);

      case GroupLayoutType.stack:
        return Stack(
          wrapped,
          alignment: alignment ?? Alignment.center,
        );
    }
  }
}

///
/// Modifier extensions for [Group].
///
/// These enable a clean, chainable API to configure layout, spacing,
/// decoration, animation, and gesture behaviors.
///
extension GroupModifiers on Group {
  /// Configures the group to use a vertical layout.
  /// Allows customizing main and cross axis alignment.
  Group makeVertical({
    MainAxisAlignment main = MainAxisAlignment.start,
    CrossAxisAlignment cross = CrossAxisAlignment.center,
  }) =>
      _copyWith(
        layout: GroupLayoutType.vertical,
        colMain: main,
        colCross: cross,
      );

  /// Configures the group to use a horizontal layout, with alignment options.
  Group makeHorizontal({
    MainAxisAlignment main = MainAxisAlignment.start,
    CrossAxisAlignment cross = CrossAxisAlignment.center,
  }) =>
      _copyWith(
        layout: GroupLayoutType.horizontal,
        rowMain: main,
        rowCross: cross,
      );

  /// Configures the group to use an overlapping stacked layout.
  Group makeStack({AlignmentGeometry alignment = Alignment.center}) =>
      _copyWith(
        layout: GroupLayoutType.stack,
        alignment: alignment,
      );

  /// Adds padding around each child in the layout.
  Group padding({
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

  /// Applies a background color to each wrapped child.
  Group backgroundColor(Color color) {
    final deco = (decoration ?? BoxDecoration()).copyWith(color: color);
    return _copyWith(decoration: deco);
  }

  /// Applies a uniform border radius to all children.
  Group radius(double value) {
    final deco = (decoration ?? BoxDecoration())
        .copyWith(borderRadius: BorderRadius.circular(value));
    return _copyWith(decoration: deco);
  }

  /// Applies frame constraints to all children.
  Group frame({double? width, double? height}) =>
      _copyWith(frameWidth: width, frameHeight: height);

  /// Sets alignment inside each wrapped child.
  Group center() => _copyWith(alignment: Alignment.center);
  Group topLeading() => _copyWith(alignment: Alignment.topLeft);
  Group topTrailing() => _copyWith(alignment: Alignment.topRight);
  Group bottomLeading() => _copyWith(alignment: Alignment.bottomLeft);
  Group bottomTrailing() => _copyWith(alignment: Alignment.bottomRight);

  /// Sets spacing between children for vertical or horizontal layouts.
  Group spacing(double? value) => _copyWith(spacing: value);

  /// Places a background widget behind each child.
  Group backgroundView(Widget view) => _copyWith(background: view);

  /// Places a widget on top of each child.
  Group overlayView(Widget view) => _copyWith(overlay: view);

  /// Adds a pointer tap handler for all wrapped children.
  Group onTapGesture(VoidCallback handler) => _copyWith(onTap: handler);

  /// Enables implicit animations for modified values.
  Group animation({
    Duration duration = const Duration(milliseconds: 250),
    Curve curve = Curves.easeInOut,
  }) =>
      _copyWith(animationDuration: duration, animationCurve: curve);
}
