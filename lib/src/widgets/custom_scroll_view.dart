// ------------------------------------------------------------
//  custom_scroll_view.dart
//
//  Created by Siva Sankar on 2025-01-09.
// ------------------------------------------------------------

import 'package:flutter/material.dart' as material;
import 'package:flutter/gestures.dart' as gestures;

/// A declarative wrapper around Flutter's [material.CustomScrollView] widget.
///
/// This widget enables a **SwiftUI-like, composable API** for building
/// custom scrollable layouts with slivers by allowing configuration through
/// immutable, chainable modifiers.
///
/// Instead of mutating properties, scroll view changes are expressed by
/// returning new instances of [CustomScrollView].
///
/// ### Example
/// ```dart
/// CustomScrollView([
///   Sliver.toBoxAdapter(child: Text('Header')),
///   Sliver.list([Text('Item 1'), Text('Item 2')]),
///   Sliver.grid(gridItems, crossAxisCount: 2),
/// ])
///   .scrollDirection(Axis.vertical)
///   .physics(BouncingScrollPhysics())
///   .padding(all: 16);
/// ```
class CustomScrollView extends material.StatelessWidget {
  final List<material.Widget> _slivers;
  final material.Axis _scrollDirection;
  final bool _reverse;
  final material.ScrollController? _controller;
  final bool? _primary;
  final material.ScrollPhysics? _physics;
  final material.ScrollBehavior? _scrollBehavior;
  final bool _shrinkWrap;
  final material.Key? _center;
  final double _anchor;
  final double? _cacheExtent;
  final int? _semanticChildCount;
  final gestures.DragStartBehavior _dragStartBehavior;
  final material.ScrollViewKeyboardDismissBehavior _keyboardDismissBehavior;
  final String? _restorationId;
  final material.Clip _clipBehavior;

  /// Creates a declarative [CustomScrollView] widget.
  ///
  /// All parameters mirror those of Flutter's [material.CustomScrollView].
  ///
  /// If not specified, default values match Flutter's standard
  /// [material.CustomScrollView] behavior.
  ///
  /// ### Example
  /// ```dart
  /// CustomScrollView(
  ///   [
  ///     Sliver.list([Text('A'), Text('B')]),
  ///     Sliver.grid(icons, crossAxisCount: 3),
  ///   ],
  ///   scrollDirection: Axis.vertical,
  ///   physics: const BouncingScrollPhysics(),
  /// );
  /// ```
  /// or
  /// ```dart
  /// CustomScrollView([
  ///   Sliver.list([Text('A'), Text('B')]),
  /// ])
  ///   .vertical()
  ///   .bouncingPhysics();
  /// ```
  const CustomScrollView(
    this._slivers, {
    super.key,
    material.Axis scrollDirection = material.Axis.vertical,
    bool reverse = false,
    material.ScrollController? controller,
    bool? primary,
    material.ScrollPhysics? physics,
    material.ScrollBehavior? scrollBehavior,
    bool shrinkWrap = false,
    material.Key? center,
    double anchor = 0.0,
    double? cacheExtent,
    int? semanticChildCount,
    gestures.DragStartBehavior dragStartBehavior =
        gestures.DragStartBehavior.start,
    material.ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        material.ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    material.Clip clipBehavior = material.Clip.hardEdge,
  })  : _scrollDirection = scrollDirection,
        _reverse = reverse,
        _controller = controller,
        _primary = primary,
        _physics = physics,
        _scrollBehavior = scrollBehavior,
        _shrinkWrap = shrinkWrap,
        _center = center,
        _anchor = anchor,
        _cacheExtent = cacheExtent,
        _semanticChildCount = semanticChildCount,
        _dragStartBehavior = dragStartBehavior,
        _keyboardDismissBehavior = keyboardDismissBehavior,
        _restorationId = restorationId,
        _clipBehavior = clipBehavior;

  /// Creates an immutable copy of this [CustomScrollView] with updated values.
  ///
  /// This method is used internally by extension modifiers to support
  /// a declarative, chainable configuration style without mutating state.
  CustomScrollView _copyWith({
    List<material.Widget>? slivers,
    material.Axis? scrollDirection,
    bool? reverse,
    material.ScrollController? controller,
    bool? primary,
    material.ScrollPhysics? physics,
    material.ScrollBehavior? scrollBehavior,
    bool? shrinkWrap,
    material.Key? center,
    double? anchor,
    double? cacheExtent,
    int? semanticChildCount,
    gestures.DragStartBehavior? dragStartBehavior,
    material.ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    String? restorationId,
    material.Clip? clipBehavior,
    bool clearController = false,
    bool clearPhysics = false,
    bool clearScrollBehavior = false,
  }) {
    return CustomScrollView(
      slivers ?? _slivers,
      key: key,
      scrollDirection: scrollDirection ?? _scrollDirection,
      reverse: reverse ?? _reverse,
      controller: clearController ? null : (controller ?? _controller),
      primary: primary ?? _primary,
      physics: clearPhysics ? null : (physics ?? _physics),
      scrollBehavior:
          clearScrollBehavior ? null : (scrollBehavior ?? _scrollBehavior),
      shrinkWrap: shrinkWrap ?? _shrinkWrap,
      center: center ?? _center,
      anchor: anchor ?? _anchor,
      cacheExtent: cacheExtent ?? _cacheExtent,
      semanticChildCount: semanticChildCount ?? _semanticChildCount,
      dragStartBehavior: dragStartBehavior ?? _dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? _keyboardDismissBehavior,
      restorationId: restorationId ?? _restorationId,
      clipBehavior: clipBehavior ?? _clipBehavior,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.CustomScrollView(
      key: key,
      scrollDirection: _scrollDirection,
      reverse: _reverse,
      controller: _controller,
      primary: _primary,
      physics: _physics,
      scrollBehavior: _scrollBehavior,
      shrinkWrap: _shrinkWrap,
      center: _center,
      anchor: _anchor,
      cacheExtent: _cacheExtent,
      semanticChildCount: _semanticChildCount,
      dragStartBehavior: _dragStartBehavior,
      keyboardDismissBehavior: _keyboardDismissBehavior,
      restorationId: _restorationId,
      clipBehavior: _clipBehavior,
      slivers: _slivers,
    );
  }
}

// MARK: - CustomScrollView Modifiers

/// Extension methods that provide expressive, chainable modifiers
/// for the declarative [CustomScrollView] widget.
///
/// Each modifier returns a **new [CustomScrollView] instance**, enabling an
/// immutable, SwiftUI-style configuration pattern.
///
/// ### Example
/// ```dart
/// CustomScrollView([sliver1, sliver2])
///   .vertical()
///   .bouncingPhysics()
///   .shrinkWrap(true)
///   .controller(myController);
/// ```
extension CustomScrollViewExtension on CustomScrollView {
  // ==================== Scroll Direction ====================

  /// Sets scroll direction to vertical.
  CustomScrollView vertical() =>
      _copyWith(scrollDirection: material.Axis.vertical);

  /// Sets scroll direction to horizontal.
  CustomScrollView horizontal() =>
      _copyWith(scrollDirection: material.Axis.horizontal);

  /// Sets the scroll direction explicitly.
  CustomScrollView scrollDirection(material.Axis direction) =>
      _copyWith(scrollDirection: direction);

  // ==================== Reverse ====================

  /// Reverses the scroll direction (scrolls from bottom to top or right to left).
  CustomScrollView reversed({bool reverse = true}) =>
      _copyWith(reverse: reverse);

  // ==================== Controller ====================

  /// Sets the scroll controller.
  CustomScrollView controller(material.ScrollController controller) =>
      _copyWith(controller: controller);

  /// Removes the scroll controller.
  CustomScrollView noController() => _copyWith(clearController: true);

  // ==================== Primary ====================

  /// Sets whether this is the primary scroll view.
  CustomScrollView primary({bool isPrimary = true}) =>
      _copyWith(primary: isPrimary);

  // ==================== Physics ====================

  /// Sets custom scroll physics.
  CustomScrollView physics(material.ScrollPhysics physics) =>
      _copyWith(physics: physics);

  /// Uses bouncing scroll physics (iOS-style).
  CustomScrollView bouncingPhysics() =>
      _copyWith(physics: const material.BouncingScrollPhysics());

  /// Uses clamping scroll physics (Android-style).
  CustomScrollView clampingPhysics() =>
      _copyWith(physics: const material.ClampingScrollPhysics());

  /// Uses always scrollable physics.
  CustomScrollView alwaysScrollablePhysics() =>
      _copyWith(physics: const material.AlwaysScrollableScrollPhysics());

  /// Uses never scrollable physics (disables scrolling).
  CustomScrollView neverScrollablePhysics() =>
      _copyWith(physics: const material.NeverScrollableScrollPhysics());

  /// Removes custom physics (uses default).
  CustomScrollView defaultPhysics() => _copyWith(clearPhysics: true);

  // ==================== Scroll Behavior ====================

  /// Sets custom scroll behavior.
  CustomScrollView scrollBehavior(material.ScrollBehavior behavior) =>
      _copyWith(scrollBehavior: behavior);

  /// Removes custom scroll behavior.
  CustomScrollView defaultScrollBehavior() =>
      _copyWith(clearScrollBehavior: true);

  // ==================== Shrink Wrap ====================

  /// Enables or disables shrink wrap mode.
  ///
  /// When true, the scroll view will take up only as much space as needed.
  CustomScrollView shrinkWrap([bool value = true]) =>
      _copyWith(shrinkWrap: value);

  // ==================== Center & Anchor ====================

  /// Sets the center key (the sliver to use as the center of the viewport).
  CustomScrollView center(material.Key centerKey) =>
      _copyWith(center: centerKey);

  /// Sets the anchor position (0.0 = top, 0.5 = middle, 1.0 = bottom).
  CustomScrollView anchor(double value) => _copyWith(anchor: value);

  // ==================== Cache Extent ====================

  /// Sets the cache extent (how far ahead to build slivers).
  CustomScrollView cacheExtent(double extent) =>
      _copyWith(cacheExtent: extent);

  // ==================== Semantic Child Count ====================

  /// Sets the number of children for semantic purposes.
  CustomScrollView semanticChildCount(int count) =>
      _copyWith(semanticChildCount: count);

  // ==================== Drag Start Behavior ====================

  /// Sets when drag gestures should start.
  CustomScrollView dragStartBehavior(gestures.DragStartBehavior behavior) =>
      _copyWith(dragStartBehavior: behavior);

  /// Starts drag from the down position.
  CustomScrollView dragStartDown() =>
      _copyWith(dragStartBehavior: gestures.DragStartBehavior.down);

  /// Starts drag from the start position (default).
  CustomScrollView dragStartFromStart() =>
      _copyWith(dragStartBehavior: gestures.DragStartBehavior.start);

  // ==================== Keyboard Dismiss Behavior ====================

  /// Sets how the keyboard should dismiss when scrolling.
  CustomScrollView keyboardDismissBehavior(
    material.ScrollViewKeyboardDismissBehavior behavior,
  ) =>
      _copyWith(keyboardDismissBehavior: behavior);

  /// Keyboard dismisses when dragging.
  CustomScrollView keyboardDismissOnDrag() => _copyWith(
        keyboardDismissBehavior:
            material.ScrollViewKeyboardDismissBehavior.onDrag,
      );

  /// Keyboard requires manual dismissal (default).
  CustomScrollView keyboardDismissManual() => _copyWith(
        keyboardDismissBehavior:
            material.ScrollViewKeyboardDismissBehavior.manual,
      );

  // ==================== Restoration ====================

  /// Sets the restoration ID for state restoration.
  CustomScrollView restorationId(String id) =>
      _copyWith(restorationId: id);

  // ==================== Clip Behavior ====================

  /// Sets the clip behavior.
  CustomScrollView clipBehavior(material.Clip clip) =>
      _copyWith(clipBehavior: clip);

  /// Clips with anti-aliasing.
  CustomScrollView clipAntiAlias() =>
      _copyWith(clipBehavior: material.Clip.antiAlias);

  /// Clips with anti-aliasing and save layer.
  CustomScrollView clipAntiAliasWithSaveLayer() =>
      _copyWith(clipBehavior: material.Clip.antiAliasWithSaveLayer);

  /// Uses hard edge clipping (default).
  CustomScrollView clipHardEdge() =>
      _copyWith(clipBehavior: material.Clip.hardEdge);

  /// Disables clipping.
  CustomScrollView noClip() => _copyWith(clipBehavior: material.Clip.none);

  // ==================== Slivers Manipulation ====================

  /// Adds a sliver to the end of the list.
  CustomScrollView addSliver(material.Widget sliver) =>
      _copyWith(slivers: [..._slivers, sliver]);

  /// Adds multiple slivers to the end of the list.
  CustomScrollView addSlivers(List<material.Widget> slivers) =>
      _copyWith(slivers: [..._slivers, ...slivers]);

  /// Inserts a sliver at the specified index.
  CustomScrollView insertSliver(int index, material.Widget sliver) {
    final newSlivers = List<material.Widget>.from(_slivers);
    newSlivers.insert(index, sliver);
    return _copyWith(slivers: newSlivers);
  }

  /// Removes a sliver at the specified index.
  CustomScrollView removeAt(int index) {
    final newSlivers = List<material.Widget>.from(_slivers);
    newSlivers.removeAt(index);
    return _copyWith(slivers: newSlivers);
  }

  /// Reverses the order of slivers.
  CustomScrollView reverseSlivers() =>
      _copyWith(slivers: _slivers.reversed.toList());

  /// Takes only the first [count] slivers.
  CustomScrollView take(int count) =>
      _copyWith(slivers: _slivers.take(count).toList());

  /// Skips the first [count] slivers.
  CustomScrollView skip(int count) =>
      _copyWith(slivers: _slivers.skip(count).toList());

  /// Filters slivers based on a predicate.
  CustomScrollView where(bool Function(material.Widget) test) =>
      _copyWith(slivers: _slivers.where(test).toList());

  // ==================== Convenience Wrappers ====================

  /// Wraps all slivers in a SliverPadding with the specified padding.
  CustomScrollView padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    final resolved = material.EdgeInsets.only(
      left: left ?? horizontal ?? all ?? 0,
      right: right ?? horizontal ?? all ?? 0,
      top: top ?? vertical ?? all ?? 0,
      bottom: bottom ?? vertical ?? all ?? 0,
    );

    final paddedSlivers = _slivers
        .map((sliver) => material.SliverPadding(
              padding: resolved,
              sliver: sliver,
            ))
        .toList();

    return _copyWith(slivers: paddedSlivers);
  }

  /// Wraps the entire scroll view with SafeArea padding.
  CustomScrollView safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    double minimum = 0.0,
  }) {
    return _copyWith(
      slivers: [
        material.SliverSafeArea(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          minimum: material.EdgeInsets.all(minimum),
          sliver: material.SliverList(
            delegate: material.SliverChildListDelegate(_slivers),
          ),
        ),
      ],
    );
  }
}