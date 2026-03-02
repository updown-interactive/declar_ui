// ------------------------------------------------------------
//  sliver.dart
//
//  Created by Siva Sankar on 2025-01-09.
// ------------------------------------------------------------

import 'package:flutter/material.dart' as material;

/// Defines the type of sliver layout to use.
enum SliverType {
  list,
  listBuilder,
  grid,
  fixedExtentList,
  prototypedExtentList,
  fillRemaining,
  fillViewport,
  toBoxAdapter,
}

/// A declarative wrapper around Flutter's Sliver widgets.
///
/// This widget enables a **SwiftUI-like, composable API** for building
/// scrollable layouts using slivers by allowing configuration through
/// immutable, chainable modifiers.
///
/// Supports multiple sliver types:
/// - [SliverType.list] → SliverList (Explicit child list)
/// - [SliverType.listBuilder] → SliverList.builder (Dynamic child list)
/// - [SliverType.grid] → SliverGrid
/// - [SliverType.fixedExtentList] → SliverFixedExtentList
/// - [SliverType.prototypedExtentList] → SliverPrototypeExtentList
/// - [SliverType.fillRemaining] → SliverFillRemaining
/// - [SliverType.fillViewport] → SliverFillViewport
/// - [SliverType.toBoxAdapter] → SliverToBoxAdapter (for single widget)
///
/// ### Example
/// ```dart
/// Sliver.list([
///   Text('Item 1'),
///   Text('Item 2'),
///   Text('Item 3'),
/// ])
///   .padding(all: 16)
///   .addSemanticIndexes();
/// ```
class Sliver extends material.StatelessWidget {
  final List<material.Widget> _children;
  final SliverType _type;

  // List properties
  final bool _addAutomaticKeepAlives;
  final bool _addRepaintBoundaries;
  final bool _addSemanticIndexes;

  // Grid properties
  final material.SliverGridDelegate? _gridDelegate;
  final int? _crossAxisCount;
  final double? _mainAxisSpacing;
  final double? _crossAxisSpacing;
  final double? _childAspectRatio;
  final double? _mainAxisExtent;

  // Fixed extent properties
  final double? _itemExtent;
  final material.Widget? _prototypeItem;

  // Fill properties
  final bool _hasScrollBody;
  final bool _fillOverscroll;
  final double? _viewportFraction;

  // Padding
  final material.EdgeInsetsGeometry? _padding;

  // Builder properties (for list/grid builder)
  final material.NullableIndexedWidgetBuilder? _itemBuilder;
  final int? _itemCount;

  // Single child (for toBoxAdapter)
  final material.Widget? _child;

  /// Creates a declarative [Sliver] widget.
  const Sliver._({
    super.key,
    List<material.Widget> children = const [],
    required SliverType type,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    material.SliverGridDelegate? gridDelegate,
    int? crossAxisCount,
    double? mainAxisSpacing,
    double? crossAxisSpacing,
    double? childAspectRatio,
    double? mainAxisExtent,
    double? itemExtent,
    material.Widget? prototypeItem,
    bool hasScrollBody = true,
    bool fillOverscroll = false,
    double? viewportFraction,
    material.EdgeInsetsGeometry? padding,
    material.Widget? child,
    material.NullableIndexedWidgetBuilder? itemBuilder,
    int? itemCount,
  }) : _children = children,
       _type = type,
       _addAutomaticKeepAlives = addAutomaticKeepAlives,
       _addRepaintBoundaries = addRepaintBoundaries,
       _addSemanticIndexes = addSemanticIndexes,
       _gridDelegate = gridDelegate,
       _crossAxisCount = crossAxisCount,
       _mainAxisSpacing = mainAxisSpacing,
       _crossAxisSpacing = crossAxisSpacing,
       _childAspectRatio = childAspectRatio,
       _mainAxisExtent = mainAxisExtent,
       _itemExtent = itemExtent,
       _prototypeItem = prototypeItem,
       _hasScrollBody = hasScrollBody,
       _fillOverscroll = fillOverscroll,
       _viewportFraction = viewportFraction,
       _padding = padding,
       _child = child,
       _itemBuilder = itemBuilder,
       _itemCount = itemCount;

  // MARK: - Factory Constructors

  /// Creates a [SliverList] with the given children.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.list([
  ///   Text('Item 1'),
  ///   Text('Item 2'),
  /// ]);
  /// ```
  factory Sliver.list(
    List<material.Widget> children, {
    material.Key? key,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.list,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      children: children,
    );
  }

  /// Creates a dynamically built [SliverList] that streams item creation.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.listBuilder(
  ///   itemBuilder: (context, index) => Text('Item $index'),
  ///   itemCount: 100,
  /// );
  /// ```
  factory Sliver.listBuilder({
    material.Key? key,
    required material.NullableIndexedWidgetBuilder itemBuilder,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.listBuilder,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }

  /// Creates a [SliverGrid] with the given children.
  ///
  /// You can specify either a custom [gridDelegate] or use convenience
  /// parameters like [crossAxisCount], [mainAxisSpacing], etc.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.grid(
  ///   [Icon(Icons.star), Icon(Icons.favorite)],
  ///   crossAxisCount: 2,
  ///   mainAxisSpacing: 8,
  ///   crossAxisSpacing: 8,
  /// );
  /// ```
  factory Sliver.grid(
    List<material.Widget> children, {
    material.Key? key,
    material.SliverGridDelegate? gridDelegate,
    int? crossAxisCount,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    double childAspectRatio = 1.0,
    double? mainAxisExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.grid,
      gridDelegate: gridDelegate,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
      mainAxisExtent: mainAxisExtent,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      children: children,
    );
  }

  /// Creates a [SliverFixedExtentList] where all children have the same extent.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.fixedExtent(
  ///   [Text('A'), Text('B')],
  ///   itemExtent: 50,
  /// );
  /// ```
  factory Sliver.fixedExtent(
    List<material.Widget> children, {
    material.Key? key,
    required double itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.fixedExtentList,
      itemExtent: itemExtent,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      children: children,
    );
  }

  /// Creates a [SliverPrototypeExtentList] where extent is determined by a prototype.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.prototypeExtent(
  ///   [Text('A'), Text('B')],
  ///   prototypeItem: Container(height: 50),
  /// );
  /// ```
  factory Sliver.prototypeExtent(
    List<material.Widget> children, {
    material.Key? key,
    required material.Widget prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.prototypedExtentList,
      prototypeItem: prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      children: children,
    );
  }

  /// Creates a [SliverFillRemaining] that fills remaining space in viewport.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.fillRemaining(
  ///   child: Center(child: Text('Footer')),
  /// );
  /// ```
  factory Sliver.fillRemaining({
    material.Key? key,
    required material.Widget child,
    bool hasScrollBody = true,
    bool fillOverscroll = false,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.fillRemaining,
      child: child,
      hasScrollBody: hasScrollBody,
      fillOverscroll: fillOverscroll,
      children: [],
    );
  }

  /// Creates a [SliverFillViewport] that sizes children to viewport height.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.fillViewport(
  ///   [Page1(), Page2()],
  ///   viewportFraction: 0.9,
  /// );
  /// ```
  factory Sliver.fillViewport(
    List<material.Widget> children, {
    material.Key? key,
    double viewportFraction = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.fillViewport,
      viewportFraction: viewportFraction,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      children: children,
    );
  }

  /// Creates a [SliverToBoxAdapter] for a single non-sliver widget.
  ///
  /// ### Example
  /// ```dart
  /// Sliver.toBoxAdapter(
  ///   child: Text('Header'),
  /// );
  /// ```
  factory Sliver.toBoxAdapter({
    material.Key? key,
    required material.Widget child,
  }) {
    return Sliver._(
      key: key,
      type: SliverType.toBoxAdapter,
      child: child,
      children: [],
    );
  }

  /// Creates an immutable copy with updated values.
  Sliver _copyWith({
    List<material.Widget>? children,
    SliverType? type,
    bool? addAutomaticKeepAlives,
    bool? addRepaintBoundaries,
    bool? addSemanticIndexes,
    material.SliverGridDelegate? gridDelegate,
    int? crossAxisCount,
    double? mainAxisSpacing,
    double? crossAxisSpacing,
    double? childAspectRatio,
    double? mainAxisExtent,
    double? itemExtent,
    material.Widget? prototypeItem,
    bool? hasScrollBody,
    bool? fillOverscroll,
    double? viewportFraction,
    material.EdgeInsetsGeometry? padding,
    material.Widget? child,
    material.NullableIndexedWidgetBuilder? itemBuilder,
    int? itemCount,
    bool clearPadding = false,
  }) {
    return Sliver._(
      key: key,
      type: type ?? _type,
      addAutomaticKeepAlives: addAutomaticKeepAlives ?? _addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries ?? _addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes ?? _addSemanticIndexes,
      gridDelegate: gridDelegate ?? _gridDelegate,
      crossAxisCount: crossAxisCount ?? _crossAxisCount,
      mainAxisSpacing: mainAxisSpacing ?? _mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing ?? _crossAxisSpacing,
      childAspectRatio: childAspectRatio ?? _childAspectRatio,
      mainAxisExtent: mainAxisExtent ?? _mainAxisExtent,
      itemExtent: itemExtent ?? _itemExtent,
      prototypeItem: prototypeItem ?? _prototypeItem,
      hasScrollBody: hasScrollBody ?? _hasScrollBody,
      fillOverscroll: fillOverscroll ?? _fillOverscroll,
      viewportFraction: viewportFraction ?? _viewportFraction,
      padding: clearPadding ? null : (padding ?? _padding),
      child: child ?? _child,
      children: children ?? _children,
      itemBuilder: itemBuilder ?? _itemBuilder,
      itemCount: itemCount ?? _itemCount,
    );
  }

  /// Builds the appropriate sliver widget based on type.
  material.Widget _buildSliver() {
    switch (_type) {
      case SliverType.list:
        return material.SliverList(
          delegate: material.SliverChildListDelegate(
            _children,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
        );

      case SliverType.listBuilder:
        return material.SliverList(
          delegate: material.SliverChildBuilderDelegate(
            _itemBuilder ??
                (context, index) => const material.SizedBox.shrink(),
            childCount: _itemCount,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
        );

      case SliverType.grid:
        final delegate =
            _gridDelegate ??
            material.SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount ?? 2,
              mainAxisSpacing: _mainAxisSpacing ?? 0,
              crossAxisSpacing: _crossAxisSpacing ?? 0,
              childAspectRatio: _childAspectRatio ?? 1.0,
              mainAxisExtent: _mainAxisExtent,
            );

        return material.SliverGrid(
          delegate: material.SliverChildListDelegate(
            _children,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
          gridDelegate: delegate,
        );

      case SliverType.fixedExtentList:
        return material.SliverFixedExtentList(
          delegate: material.SliverChildListDelegate(
            _children,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
          itemExtent: _itemExtent ?? 50,
        );

      case SliverType.prototypedExtentList:
        return material.SliverPrototypeExtentList(
          delegate: material.SliverChildListDelegate(
            _children,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
          prototypeItem: _prototypeItem ?? const material.SizedBox(),
        );

      case SliverType.fillRemaining:
        return material.SliverFillRemaining(
          hasScrollBody: _hasScrollBody,
          fillOverscroll: _fillOverscroll,
          child: _child,
        );

      case SliverType.fillViewport:
        return material.SliverFillViewport(
          delegate: material.SliverChildListDelegate(
            _children,
            addAutomaticKeepAlives: _addAutomaticKeepAlives,
            addRepaintBoundaries: _addRepaintBoundaries,
            addSemanticIndexes: _addSemanticIndexes,
          ),
          viewportFraction: _viewportFraction ?? 1.0,
        );

      case SliverType.toBoxAdapter:
        return material.SliverToBoxAdapter(child: _child);
    }
  }

  @override
  material.Widget build(material.BuildContext context) {
    material.Widget sliver = _buildSliver();

    // Apply padding if specified
    if (_padding != null) {
      sliver = material.SliverPadding(padding: _padding!, sliver: sliver);
    }

    return sliver;
  }
}

// MARK: - Sliver Modifiers

/// Extension methods that provide expressive, chainable modifiers
/// for the declarative [Sliver] widget.
///
/// Each modifier returns a **new [Sliver] instance**, enabling an
/// immutable, SwiftUI-style configuration pattern.
///
/// ### Example
/// ```dart
/// Sliver.list([Text('A'), Text('B')])
///   .padding(all: 16)
///   .disableKeepAlives();
/// ```
extension SliverExtension on Sliver {
  // ==================== Padding ====================

  /// Wraps the sliver with [SliverPadding].
  Sliver padding({
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
    return _copyWith(padding: resolved);
  }

  /// Removes any padding.
  Sliver noPadding() => _copyWith(clearPadding: true);

  // ==================== List Behavior ====================

  /// Disables automatic keep-alives for children.
  Sliver disableKeepAlives() => _copyWith(addAutomaticKeepAlives: false);

  /// Enables automatic keep-alives for children.
  Sliver enableKeepAlives() => _copyWith(addAutomaticKeepAlives: true);

  /// Disables repaint boundaries for children.
  Sliver disableRepaintBoundaries() => _copyWith(addRepaintBoundaries: false);

  /// Enables repaint boundaries for children.
  Sliver enableRepaintBoundaries() => _copyWith(addRepaintBoundaries: true);

  /// Disables semantic indexes.
  Sliver disableSemanticIndexes() => _copyWith(addSemanticIndexes: false);

  /// Enables semantic indexes.
  Sliver enableSemanticIndexes() => _copyWith(addSemanticIndexes: true);

  // ==================== Grid Configuration ====================

  /// Updates the grid's cross-axis count.
  Sliver crossAxisCount(int count) => _copyWith(crossAxisCount: count);

  /// Sets main axis spacing for grid.
  Sliver mainAxisSpacing(double spacing) => _copyWith(mainAxisSpacing: spacing);

  /// Sets cross axis spacing for grid.
  Sliver crossAxisSpacing(double spacing) =>
      _copyWith(crossAxisSpacing: spacing);

  /// Sets child aspect ratio for grid.
  Sliver childAspectRatio(double ratio) => _copyWith(childAspectRatio: ratio);

  /// Sets main axis extent for grid items.
  Sliver mainAxisExtent(double extent) => _copyWith(mainAxisExtent: extent);

  /// Applies a custom grid delegate.
  Sliver gridDelegate(material.SliverGridDelegate delegate) =>
      _copyWith(gridDelegate: delegate);

  // ==================== Fixed/Prototype Extent ====================

  /// Sets the item extent for fixed extent lists.
  Sliver itemExtent(double extent) => _copyWith(itemExtent: extent);

  /// Sets the prototype item for prototype extent lists.
  Sliver prototypeItem(material.Widget item) => _copyWith(prototypeItem: item);

  // ==================== Fill Configuration ====================

  /// Sets whether the fill remaining has a scroll body.
  Sliver hasScrollBody(bool value) => _copyWith(hasScrollBody: value);

  /// Sets whether to fill overscroll area.
  Sliver fillOverscroll(bool value) => _copyWith(fillOverscroll: value);

  /// Sets viewport fraction for fill viewport.
  Sliver viewportFraction(double fraction) =>
      _copyWith(viewportFraction: fraction);

  // ==================== Children Manipulation ====================

  /// Reverses the order of children.
  Sliver reversed() => _copyWith(children: _children.reversed.toList());

  /// Takes only the first [count] children.
  Sliver take(int count) => _copyWith(children: _children.take(count).toList());

  /// Skips the first [count] children.
  Sliver skip(int count) => _copyWith(children: _children.skip(count).toList());

  /// Filters children based on a predicate.
  Sliver where(bool Function(material.Widget) test) =>
      _copyWith(children: _children.where(test).toList());
}
