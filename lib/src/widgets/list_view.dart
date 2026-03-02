// ------------------------------------------------------------ //
//  list_view.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [ListView] widget that supports
/// fluent-style chaining through extension methods.
class ListView extends material.StatelessWidget {
  final List<material.Widget> _children;
  final material.Axis _scrollDirection;
  final bool _reverse;
  final bool _shrinkWrap;
  final material.EdgeInsetsGeometry? _padding;
  final material.ScrollPhysics? _physics;
  final material.ScrollController? _controller;

  // Builder properties
  final material.NullableIndexedWidgetBuilder? _itemBuilder;
  final int? _itemCount;

  const ListView({
    super.key,
    List<material.Widget> children = const [],
    material.Axis scrollDirection = material.Axis.vertical,
    bool reverse = false,
    bool shrinkWrap = false,
    material.EdgeInsetsGeometry? padding,
    material.ScrollPhysics? physics,
    material.ScrollController? controller,
    material.NullableIndexedWidgetBuilder? itemBuilder,
    int? itemCount,
  }) : _children = children,
       _scrollDirection = scrollDirection,
       _reverse = reverse,
       _shrinkWrap = shrinkWrap,
       _padding = padding,
       _physics = physics,
       _controller = controller,
       _itemBuilder = itemBuilder,
       _itemCount = itemCount;

  const ListView.children(
    this._children, {
    super.key,
    material.Axis scrollDirection = material.Axis.vertical,
    bool reverse = false,
    bool shrinkWrap = false,
    material.EdgeInsetsGeometry? padding,
    material.ScrollPhysics? physics,
    material.ScrollController? controller,
  }) : _scrollDirection = scrollDirection,
       _reverse = reverse,
       _shrinkWrap = shrinkWrap,
       _padding = padding,
       _physics = physics,
       _controller = controller,
       _itemBuilder = null,
       _itemCount = null;

  const ListView.builder({
    super.key,
    required material.NullableIndexedWidgetBuilder itemBuilder,
    int? itemCount,
    material.Axis scrollDirection = material.Axis.vertical,
    bool reverse = false,
    bool shrinkWrap = false,
    material.EdgeInsetsGeometry? padding,
    material.ScrollPhysics? physics,
    material.ScrollController? controller,
  }) : _itemBuilder = itemBuilder,
       _itemCount = itemCount,
       _children = const [],
       _scrollDirection = scrollDirection,
       _reverse = reverse,
       _shrinkWrap = shrinkWrap,
       _padding = padding,
       _physics = physics,
       _controller = controller;

  ListView _copyWith({
    List<material.Widget>? children,
    material.Axis? scrollDirection,
    bool? reverse,
    bool? shrinkWrap,
    material.EdgeInsetsGeometry? padding,
    material.ScrollPhysics? physics,
    material.ScrollController? controller,
    bool clearController = false,
    material.NullableIndexedWidgetBuilder? itemBuilder,
    int? itemCount,
  }) {
    return ListView(
      key: key,
      children: children ?? _children,
      scrollDirection: scrollDirection ?? _scrollDirection,
      reverse: reverse ?? _reverse,
      shrinkWrap: shrinkWrap ?? _shrinkWrap,
      padding: padding ?? _padding,
      physics: physics ?? _physics,
      controller: clearController ? null : (controller ?? _controller),
      itemBuilder: itemBuilder ?? _itemBuilder,
      itemCount: itemCount ?? _itemCount,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    if (_itemBuilder != null) {
      return material.ListView.builder(
        key: key,
        scrollDirection: _scrollDirection,
        reverse: _reverse,
        shrinkWrap: _shrinkWrap,
        padding: _padding,
        physics: _physics,
        controller: _controller,
        itemBuilder: _itemBuilder,
        itemCount: _itemCount,
      );
    }

    return material.ListView(
      key: key,
      scrollDirection: _scrollDirection,
      reverse: _reverse,
      shrinkWrap: _shrinkWrap,
      padding: _padding,
      physics: _physics,
      controller: _controller,
      children: _children,
    );
  }
}

// MARK: - Extension

extension ListViewExtension on ListView {
  ListView direction(material.Axis direction) =>
      _copyWith(scrollDirection: direction);
  ListView horizontal() => _copyWith(scrollDirection: material.Axis.horizontal);
  ListView vertical() => _copyWith(scrollDirection: material.Axis.vertical);

  ListView reverse([bool reverse = true]) => _copyWith(reverse: reverse);
  ListView shrinkWrap([bool shrinkWrap = true]) =>
      _copyWith(shrinkWrap: shrinkWrap);

  ListView controller(material.ScrollController controller) =>
      _copyWith(controller: controller);
  ListView noController() => _copyWith(clearController: true);

  ListView padding(material.EdgeInsetsGeometry padding) =>
      _copyWith(padding: padding);
  ListView paddingAll(double padding) =>
      _copyWith(padding: material.EdgeInsets.all(padding));
  ListView paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      _copyWith(
        padding: material.EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
      );

  ListView physics(material.ScrollPhysics physics) =>
      _copyWith(physics: physics);
  ListView bouncing() =>
      _copyWith(physics: const material.BouncingScrollPhysics());
  ListView clamping() =>
      _copyWith(physics: const material.ClampingScrollPhysics());
  ListView neverScrollable() =>
      _copyWith(physics: const material.NeverScrollableScrollPhysics());

  ListView children(List<material.Widget> newChildren) =>
      _copyWith(children: newChildren);
  ListView append(List<material.Widget> more) =>
      _copyWith(children: [..._children, ...more]);
}
