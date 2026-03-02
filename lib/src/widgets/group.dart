// ------------------------------------------------------------
// group.dart
// Created by Siva Sankar on 2025-12-xx.
// ------------------------------------------------------------

import 'package:flutter/material.dart';

/// Defines layout types for the [Group] widget.
///
/// These represent common UI layout patterns:
/// - [vertical] → Arranges widgets from top to bottom.
/// - [horizontal] → Arranges widgets from left to right.
/// - [stack] → Overlaps widgets on top of one another.
/// - [wrap] → Arranges widgets in a flowing wrap layout.
enum GroupLayoutType {
  vertical,
  horizontal,
  stack,
  wrap,
}

/// A high-level layout container that unifies Column, Row, Stack, and Wrap
/// with a chainable modifier API.
///
/// [Group] supports four layout modes:
/// - Vertical layout (Column-like)
/// - Horizontal layout (Row-like)
/// - Stacked layout (Stack-like, overlapping children)
/// - Wrap layout (Wrap-like, flowing arrangement)
///
/// Features:
/// - Padding (applied to the container, not individual children)
/// - Decoration (color, border, radius, shadows, gradients)
/// - Container-level alignment
/// - Spacing between items (uses native Column/Row spacing)
/// - Overlays and background widgets
/// - Tap gesture handling
/// - Implicit animations
/// - Scroll support for overflowing content
///
/// Example:
/// ```dart
/// Group([
///   Text("Item 1"),
///   Text("Item 2"),
///   Text("Item 3"),
/// ])
///   .makeVertical(main: MainAxisAlignment.center)
///   .padding(all: 16)
///   .backgroundColor(Colors.blue)
///   .cornerRadius(12)
///   .spacing(8);
/// ```
class Group extends StatelessWidget {
  final List<Widget> _children;
  final GroupLayoutType layout;

  // Container-level properties
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final AlignmentGeometry? containerAlignment;
  final double? width;
  final double? height;
  final Widget? overlay;
  final Widget? background;
  final VoidCallback? onTap;
  final Duration? animationDuration;
  final Curve? animationCurve;

  // Layout-specific alignments
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  // Stack-specific
  final StackFit stackFit;
  final AlignmentGeometry stackAlignment;

  // Wrap-specific
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;
  final Axis wrapDirection;

  // Spacing (native support in Column/Row, manual for Wrap)
  final double spacing;
  final double? runSpacing; // For wrap layout

  // Scroll support
  final bool scrollable;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  /// A high-level layout container that unifies Column, Row, Stack, and Wrap
  /// with a chainable modifier API.
  ///
  /// [Group] supports four layout modes:
  /// - Vertical layout (Column-like)
  /// - Horizontal layout (Row-like)
  /// - Stacked layout (Stack-like, overlapping children)
  /// - Wrap layout (Wrap-like, flowing arrangement)
  ///
  /// Features:
  /// - Padding (applied to the container, not individual children)
  /// - Decoration (color, border, radius, shadows, gradients)
  /// - Container-level alignment
  /// - Spacing between items (uses native Column/Row spacing)
  /// - Overlays and background widgets
  /// - Tap gesture handling
  /// - Implicit animations
  /// - Scroll support for overflowing content
  ///
  /// Example:
  /// ```dart
  /// Group([
  ///   Text("Item 1"),
  ///   Text("Item 2"),
  ///   Text("Item 3"),
  /// ])
  ///   .makeVertical(main: MainAxisAlignment.center)
  ///   .padding(all: 16)
  ///   .backgroundColor(Colors.blue)
  ///   .cornerRadius(12)
  ///   .spacing(8);
  /// ```
  const Group({
    super.key,
    List<Widget> children = const [],
    this.layout = GroupLayoutType.vertical,
    this.padding,
    this.decoration,
    this.containerAlignment,
    this.width,
    this.height,
    this.overlay,
    this.background,
    this.onTap,
    this.animationDuration,
    this.animationCurve,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.stackFit = StackFit.loose,
    this.stackAlignment = Alignment.center,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.wrapDirection = Axis.horizontal,
    this.spacing = 0,
    this.runSpacing,
    this.scrollable = false,
    this.scrollPhysics,
    this.scrollController,
  }) : _children = children;

  /// Creates an updated copy with changed properties.
  Group _copyWith({
    List<Widget>? children,
    GroupLayoutType? layout,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
    AlignmentGeometry? containerAlignment,
    double? width,
    double? height,
    Widget? overlay,
    Widget? background,
    VoidCallback? onTap,
    Duration? animationDuration,
    Curve? animationCurve,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    StackFit? stackFit,
    AlignmentGeometry? stackAlignment,
    WrapAlignment? wrapAlignment,
    WrapCrossAlignment? wrapCrossAlignment,
    Axis? wrapDirection,
    double? spacing,
    double? runSpacing,
    bool? scrollable,
    ScrollPhysics? scrollPhysics,
    ScrollController? scrollController,
    bool clearOverlay = false,
    bool clearBackground = false,
  }) {
    return Group(
      key: key,
      layout: layout ?? this.layout,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      containerAlignment: containerAlignment ?? this.containerAlignment,
      width: width ?? this.width,
      height: height ?? this.height,
      overlay: clearOverlay ? null : (overlay ?? this.overlay),
      background: clearBackground ? null : (background ?? this.background),
      onTap: onTap ?? this.onTap,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      stackFit: stackFit ?? this.stackFit,
      stackAlignment: stackAlignment ?? this.stackAlignment,
      wrapAlignment: wrapAlignment ?? this.wrapAlignment,
      wrapCrossAlignment: wrapCrossAlignment ?? this.wrapCrossAlignment,
      wrapDirection: wrapDirection ?? this.wrapDirection,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      scrollable: scrollable ?? this.scrollable,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      scrollController: scrollController ?? this.scrollController,
      children: children ?? _children,
    );
  }

  /// Builds the appropriate layout widget based on [layout] type.
  Widget _buildLayout() {
    switch (layout) {
      case GroupLayoutType.horizontal:
        return _buildRow();
      case GroupLayoutType.vertical:
        return _buildColumn();
      case GroupLayoutType.stack:
        return _buildStack();
      case GroupLayoutType.wrap:
        return _buildWrap();
    }
  }

  Widget _buildRow() {
    // Use native spacing parameter in Row (Flutter 3.10+)
    final content = Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
      children: _children,
    );

    return scrollable
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: scrollPhysics,
            controller: scrollController,
            child: content,
          )
        : content;
  }

  Widget _buildColumn() {
    // Use native spacing parameter in Column (Flutter 3.10+)
    final content = Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
      children: _children,
    );

    return scrollable
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: scrollPhysics,
            controller: scrollController,
            child: content,
          )
        : content;
  }

  Widget _buildStack() {
    return Stack(
      alignment: stackAlignment,
      fit: stackFit,
      children: _children,
    );
  }

  Widget _buildWrap() {
    return Wrap(
      direction: wrapDirection,
      alignment: wrapAlignment,
      crossAxisAlignment: wrapCrossAlignment,
      spacing: spacing,
      runSpacing: runSpacing ?? spacing,
      children: _children,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _buildLayout();

    // Apply background
    if (background != null) {
      content = Stack(
        children: [background!, content],
      );
    }

    // Apply overlay
    if (overlay != null) {
      content = Stack(
        children: [content, overlay!],
      );
    }

    // Apply animated container with decoration and padding
    content = AnimatedContainer(
      duration: animationDuration ?? Duration.zero,
      curve: animationCurve ?? Curves.linear,
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
      alignment: containerAlignment,
      child: content,
    );

    // Apply tap gesture
    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}

/// Modifier extensions for [Group].
///
/// These enable a clean, chainable API for configuring layout, spacing,
/// decoration, animation, and gesture behaviors.
extension GroupModifiers on Group {
  // ==================== Layout Configuration ====================

  /// Configures vertical layout (Column-like).
  Group makeVertical({
    MainAxisAlignment main = MainAxisAlignment.start,
    CrossAxisAlignment cross = CrossAxisAlignment.center,
    MainAxisSize size = MainAxisSize.max,
  }) =>
      _copyWith(
        layout: GroupLayoutType.vertical,
        mainAxisAlignment: main,
        crossAxisAlignment: cross,
        mainAxisSize: size,
      );

  /// Configures horizontal layout (Row-like).
  Group makeHorizontal({
    MainAxisAlignment main = MainAxisAlignment.start,
    CrossAxisAlignment cross = CrossAxisAlignment.center,
    MainAxisSize size = MainAxisSize.max,
  }) =>
      _copyWith(
        layout: GroupLayoutType.horizontal,
        mainAxisAlignment: main,
        crossAxisAlignment: cross,
        mainAxisSize: size,
      );

  /// Configures stacked layout (Stack-like).
  Group makeStack({
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
  }) =>
      _copyWith(
        layout: GroupLayoutType.stack,
        stackAlignment: alignment,
        stackFit: fit,
      );

  /// Configures wrap layout (Wrap-like).
  Group makeWrap({
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    WrapCrossAlignment crossAlignment = WrapCrossAlignment.start,
  }) =>
      _copyWith(
        layout: GroupLayoutType.wrap,
        wrapDirection: direction,
        wrapAlignment: alignment,
        wrapCrossAlignment: crossAlignment,
      );

  // ==================== Padding ====================

  /// Adds padding to the container.
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

  // ==================== Decoration ====================

  /// Sets background color.
  Group backgroundColor(Color color) {
    final deco = (decoration ?? const BoxDecoration()).copyWith(color: color);
    return _copyWith(decoration: deco);
  }

  /// Sets gradient background.
  Group backgroundGradient(Gradient gradient) {
    final deco =
        (decoration ?? const BoxDecoration()).copyWith(gradient: gradient);
    return _copyWith(decoration: deco);
  }

  /// Applies uniform corner radius.
  Group cornerRadius(double value) {
    final deco = (decoration ?? const BoxDecoration())
        .copyWith(borderRadius: BorderRadius.circular(value));
    return _copyWith(decoration: deco);
  }

  /// Applies custom border radius.
  Group customRadius(BorderRadius radius) {
    final deco =
        (decoration ?? const BoxDecoration()).copyWith(borderRadius: radius);
    return _copyWith(decoration: deco);
  }

  /// Adds a border.
  Group border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
  }) {
    final deco = (decoration ?? const BoxDecoration())
        .copyWith(border: Border.all(color: color, width: width));
    return _copyWith(decoration: deco);
  }

  /// Adds a custom border.
  Group customBorder(BoxBorder border) {
    final deco = (decoration ?? const BoxDecoration()).copyWith(border: border);
    return _copyWith(decoration: deco);
  }

  /// Adds shadow(s).
  Group shadow({
    Color color = const Color(0x33000000),
    double blurRadius = 8.0,
    Offset offset = Offset.zero,
    double spreadRadius = 0.0,
  }) {
    final newShadow = BoxShadow(
      color: color,
      blurRadius: blurRadius,
      offset: offset,
      spreadRadius: spreadRadius,
    );
    final shadows = [...?decoration?.boxShadow, newShadow];
    final deco =
        (decoration ?? const BoxDecoration()).copyWith(boxShadow: shadows);
    return _copyWith(decoration: deco);
  }

  // ==================== Size & Alignment ====================

  /// Sets fixed width and/or height.
  Group frame({double? width, double? height}) =>
      _copyWith(width: width, height: height);

  /// Centers content within container.
  Group center() => _copyWith(containerAlignment: Alignment.center);

  /// Aligns content to top-left.
  Group topLeading() => _copyWith(containerAlignment: Alignment.topLeft);

  /// Aligns content to top-right.
  Group topTrailing() => _copyWith(containerAlignment: Alignment.topRight);

  /// Aligns content to bottom-left.
  Group bottomLeading() => _copyWith(containerAlignment: Alignment.bottomLeft);

  /// Aligns content to bottom-right.
  Group bottomTrailing() =>
      _copyWith(containerAlignment: Alignment.bottomRight);

  /// Sets custom container alignment.
  Group align(AlignmentGeometry alignment) =>
      _copyWith(containerAlignment: alignment);

  // ==================== Spacing ====================

  /// Sets spacing between children (uses native Column/Row spacing).
  Group spacing(double value) => _copyWith(spacing: value);

  /// Sets run spacing for wrap layout.
  Group runSpacing(double value) => _copyWith(runSpacing: value);

  // ==================== Overlay & Background ====================

  /// Adds a background widget behind the layout.
  Group backgroundView(Widget view) => _copyWith(background: view);

  /// Adds an overlay widget on top of the layout.
  Group overlayView(Widget view) => _copyWith(overlay: view);

  // ==================== Gestures ====================

  /// Adds tap gesture handler.
  Group onTapGesture(VoidCallback handler) => _copyWith(onTap: handler);

  // ==================== Animation ====================

  /// Enables implicit animations for container properties.
  Group animation({
    Duration duration = const Duration(milliseconds: 250),
    Curve curve = Curves.easeInOut,
  }) =>
      _copyWith(animationDuration: duration, animationCurve: curve);

  // ==================== Scroll Support ====================

  /// Makes the group scrollable.
  Group scrollable({
    ScrollPhysics? physics,
    ScrollController? controller,
  }) =>
      _copyWith(
        scrollable: true,
        scrollPhysics: physics,
        scrollController: controller,
      );
}
