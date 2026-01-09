import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


//MARK: - Constants
/// A set of predefined spacing values used throughout the UI for
/// consistent padding, margin, and layout gaps.
///
/// ### Why use `Spacing`?
/// - Provides **consistent spacing** across the app.
/// - Easier to maintain design system values in one place.
/// - Improves readability compared to "magic numbers" (e.g., `SizedBox(height: 16)`).
/// - Works well with responsive or theme-driven UIs.
///
/// ### Usage example:
/// ```dart
/// Space(Spacing.medium); // Adds 16.0 px vertical/horizontal space
/// Column(
///   children:[
///   Text("Hello World"),
///   Space(Spacing.large), // Adds 24.0 px vertical space
///   Text("Sadhanam kayyil undo..???"),
///   ]
/// )
/// ```
///
/// ### Naming convention:
/// - `tiny` → 2.0
/// - `extraSmall` → 4.0
/// - `small` → 8.0
/// - `medium` → 16.0
/// - `large` → 24.0
/// - `extraLarge` → 32.0
/// - `huge` → 40.0
/// - `massive` → 48.0
enum Spacing {
  /// Tiny spacing (`2.0`).
  tiny,

  /// Extra small spacing (`4.0`).
  extraSmall,

  /// Small spacing (`8.0`).
  small,

  /// Medium spacing (`16.0`).
  medium,

  /// Large spacing (`24.0`).
  large,

  /// Extra large spacing (`32.0`).
  extraLarge,

  /// Huge spacing (`40.0`).
  huge,

  /// Massive spacing (`48.0`).
  massive,
}

/// Extension to convert [Spacing] enum values into concrete `double` values.
///
/// Provides the actual spacing measurement in logical pixels (dp)
/// for use in Flutter widgets such as `SizedBox`, `Padding`, and `Margin`.
extension SpacingValue on Spacing {
  /// Returns the `double` value (in logical pixels) corresponding to the [Spacing] size.
  double get value {
    switch (this) {
      case Spacing.tiny:
        return 2.0;
      case Spacing.extraSmall:
        return 4.0;
      case Spacing.small:
        return 8.0;
      case Spacing.medium:
        return 16.0;
      case Spacing.large:
        return 24.0;
      case Spacing.extraLarge:
        return 32.0;
      case Spacing.huge:
        return 40.0;
      case Spacing.massive:
        return 48.0;
    }
  }
}


//MARK: - Rendering
class RenderSpace extends RenderBox {
  RenderSpace({
    required double mainAxisExtent,
    double? crossAxisExtent,
    Axis? fallbackDirection,
    Color? color,
  })  : _mainAxisExtent = mainAxisExtent,
        _crossAxisExtent = crossAxisExtent,
        _fallbackDirection = fallbackDirection,
        _color = color;

  double _mainAxisExtent;
  double? _crossAxisExtent;
  Axis? _fallbackDirection;
  Color? _color;

  double get mainAxisExtent => _mainAxisExtent;
  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  double? get crossAxisExtent => _crossAxisExtent;
  set crossAxisExtent(double? value) {
    if (_crossAxisExtent != value) {
      _crossAxisExtent = value;
      markNeedsLayout();
    }
  }

  Axis? get fallbackDirection => _fallbackDirection;
  set fallbackDirection(Axis? value) {
    if (_fallbackDirection != value) {
      _fallbackDirection = value;
      markNeedsLayout();
    }
  }

  Color? get color => _color;
  set color(Color? value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  Axis? get _direction {
    final parentNode = parent;
    if (parentNode is RenderFlex) return parentNode.direction;
    return fallbackDirection;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final dir = _direction;
    if (dir == null) {
      throw FlutterError('Space must be inside a Flex or provide fallbackDirection.');
    }

    if (dir == Axis.horizontal) {
      return constraints.constrain(Size(mainAxisExtent, crossAxisExtent ?? 0));
    } else {
      return constraints.constrain(Size(crossAxisExtent ?? 0, mainAxisExtent));
    }
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final paint = Paint()..color = color!;
      context.canvas.drawRect(offset & size, paint);
    }
  }
}



class RenderSliverSpace extends RenderSliver {
  RenderSliverSpace({
    required double mainAxisExtent,
    Color? color,
    required double maxExtent,
  }) : _mainAxisExtent = mainAxisExtent,
       _color = color;

  double get mainAxisExtent => _mainAxisExtent;
  double _mainAxisExtent;
  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  Color? get color => _color;
  Color? _color;
  set color(Color? value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    final double paintExtent = calculatePaintOffset(
      constraints,
      from: 0,
      to: mainAxisExtent,
    );
    final double cacheExtent = calculateCacheOffset(
      constraints,
      from: 0,
      to: mainAxisExtent,
    );

    assert(paintExtent.isFinite);
    assert(paintExtent >= 0.0);
    geometry = SliverGeometry(
      scrollExtent: mainAxisExtent,
      paintExtent: paintExtent,
      cacheExtent: cacheExtent,
      maxPaintExtent: mainAxisExtent,
      hitTestExtent: paintExtent,
      hasVisualOverflow:
          mainAxisExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final Paint paint = Paint()..color = color!;
      final Size size = constraints
          .asBoxConstraints(
            minExtent: geometry!.paintExtent,
            maxExtent: geometry!.paintExtent,
          )
          .constrain(Size.zero);
      context.canvas.drawRect(offset & size, paint);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(ColorProperty('color', color));
  }
}


//MARK: - Widgets



/// A widget that creates space along the main axis of its parent layout.
///
/// Supports both explicit numeric spacing and enum-based predefined spacing.
/// Automatically adapts to the scroll direction of ancestor scrollables.
///
/// Examples:
/// ```dart
/// Space(20)          // 20 pixels (int or double)
/// Space(Spacing.l)   // Large predefined spacing
/// Space(Spacing.m, crossAxisExtent: 10)  // Medium spacing with cross-axis
/// ```
class Space extends StatelessWidget {
  /// Creates a space with either explicit numeric extent or enum-based spacing.
  ///
  /// The [extent] parameter can be either:
  /// - a [num] (int or double) for explicit pixel spacing (e.g., `Space(20)` or `Space(20.0)`)
  /// - a [Spacing] enum for predefined spacing (e.g., `Space(Spacing.l)`)
  const Space(this.extent, {super.key, this.crossAxisExtent, this.color});

  /// Creates a space with predefined enum-based spacing.
  const Space.size(Spacing size, {super.key, this.crossAxisExtent, this.color})
    : extent = size;

  const Space.tiny({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.tiny;

  const Space.extraSmall({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.extraSmall;

  const Space.small({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.small;

  const Space.medium({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.medium;

  const Space.large({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.large;

  const Space.extraLarge({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.extraLarge;

  const Space.huge({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.huge;

  const Space.massive({super.key, this.crossAxisExtent, this.color})
    : extent = Spacing.massive;

  /// The extent along the main axis.
  /// Can be either a [num] (int/double) or [Spacing] enum.
  final Object extent;

  /// Spacing along the cross axis. Defaults to 0.
  final double? crossAxisExtent;

  /// Optional color for debugging or visual purposes.
  final Color? color;

  /// Gets the effective main axis extent in pixels.
  double get _effectiveMainAxisExtent {
    if (extent is num) {
      return (extent as num).toDouble();
    } else if (extent is Spacing) {
      return (extent as Spacing).value;
    }
    return 0.0;
  }

  /// Whether this space has any actual extent.
  bool get hasExtent => _effectiveMainAxisExtent > 0;

  /// Returns the spacing type if using enum, null if using numeric value.
  Spacing? get spacingType => extent is Spacing ? extent as Spacing : null;

  /// Returns the numeric value if using explicit pixels, null if using enum.
  double? get numericExtent =>
      extent is num ? (extent as num).toDouble() : null;

  @override
  Widget build(BuildContext context) {
    // Validate the extent parameter: allow num (int/double) or Spacing.
    assert(
      extent is num || extent is Spacing,
      'extent must be either a num (int/double) or Spacing enum. Got: ${extent.runtimeType}',
    );

    if (extent is num) {
      final val = (extent as num).toDouble();
      assert(val >= 0, 'numeric extent must be non-negative. Got: $extent');
    }

    final scrollable = Scrollable.maybeOf(context);
    final fallbackDirection = scrollable?.axisDirection != null
        ? axisDirectionToAxis(scrollable!.axisDirection)
        : null;

    return _RawSpace(
      _effectiveMainAxisExtent,
      crossAxisExtent: crossAxisExtent ?? 0,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    if (extent is num) {
      properties.add(DoubleProperty('extent', (extent as num).toDouble()));
    } else if (extent is Spacing) {
      properties.add(EnumProperty<Spacing>('extent', extent as Spacing));
    } else {
      properties.add(DiagnosticsProperty<Object>('extent', extent));
    }

    properties.add(DoubleProperty('effectiveExtent', _effectiveMainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(
      FlagProperty('hasExtent', value: hasExtent, ifFalse: 'zero extent'),
    );
  }
}

/// A flexible space widget that expands to fill available space along the main axis.
class MaxSpace extends StatelessWidget {
  /// Creates a flexible space with a minimum main axis extent.
  ///
  /// The [extent] parameter can be either:
  /// - a [num] for explicit pixel spacing
  /// - a [Spacing] enum for predefined spacing
  const MaxSpace(
    this.extent, {
    super.key,
    this.crossAxisExtent,
    this.color,
    this.flex = 1,
  });

  /// Creates a flexible space that takes all available space.
  const MaxSpace.fill({
    super.key,
    this.crossAxisExtent,
    this.color,
    this.flex = 1,
  }) : extent = 0.0;

  /// Minimum extent along the main axis.
  /// Can be either a [num] (int/double) or [Spacing] enum.
  final Object extent;

  /// Spacing along the cross axis. Defaults to 0.
  final double? crossAxisExtent;

  /// Optional color for debugging or visual purposes.
  final Color? color;

  /// How much space this widget should occupy relative to other flexible widgets.
  final int flex;

  /// Gets the effective main axis extent in pixels.
  double get _effectiveMainAxisExtent {
    if (extent is num) {
      return (extent as num).toDouble();
    } else if (extent is Spacing) {
      return (extent as Spacing).value;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // Validate the extent parameter
    assert(
      extent is num || extent is Spacing,
      'extent must be either a num (int/double) or Spacing enum. Got: ${extent.runtimeType}',
    );

    if (extent is num) {
      final val = (extent as num).toDouble();
      assert(val >= 0, 'numeric extent must be non-negative. Got: $extent');
    }

    return Flexible(
      flex: flex,
      child: _RawSpace(
        _effectiveMainAxisExtent,
        crossAxisExtent: crossAxisExtent ?? 0,
        color: color,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    if (extent is num) {
      properties.add(DoubleProperty('extent', (extent as num).toDouble()));
    } else if (extent is Spacing) {
      properties.add(EnumProperty<Spacing>('extent', extent as Spacing));
    } else {
      properties.add(DiagnosticsProperty<Object>('extent', extent));
    }

    properties.add(DoubleProperty('effectiveExtent', _effectiveMainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(IntProperty('flex', flex));
  }
}

/// Internal render object widget that handles the actual space rendering.
class _RawSpace extends LeafRenderObjectWidget {
  const _RawSpace(
    this.mainAxisExtent, {
    required this.crossAxisExtent,
    this.color,
    this.fallbackDirection,
  });

  final double mainAxisExtent;
  final double crossAxisExtent;
  final Color? color;
  final Axis? fallbackDirection;

  @override
  RenderSpace createRenderObject(BuildContext context) {
    return RenderSpace(
      mainAxisExtent: mainAxisExtent,
      crossAxisExtent: crossAxisExtent,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderSpace renderObject) {
    renderObject
      ..mainAxisExtent = mainAxisExtent
      ..crossAxisExtent = crossAxisExtent
      ..color = color
      ..fallbackDirection = fallbackDirection;
  }
}

/// A sliver widget that creates space in a scrollable area.
class SliverSpace extends LeafRenderObjectWidget {
  const SliverSpace(this.extent, {super.key, this.color});

  const SliverSpace.size(Spacing size, {super.key, this.color}) : extent = size;

  const SliverSpace.tiny({super.key, this.color}) : extent = Spacing.tiny;
  const SliverSpace.extraSmall({super.key, this.color})
    : extent = Spacing.extraSmall;
  const SliverSpace.small({super.key, this.color}) : extent = Spacing.small;
  const SliverSpace.medium({super.key, this.color}) : extent = Spacing.medium;
  const SliverSpace.large({super.key, this.color}) : extent = Spacing.large;
  const SliverSpace.extraLarge({super.key, this.color})
    : extent = Spacing.extraLarge;
  const SliverSpace.huge({super.key, this.color}) : extent = Spacing.huge;
  const SliverSpace.massive({super.key, this.color}) : extent = Spacing.massive;
  const SliverSpace.zero({super.key, this.color}) : extent = 0;

  /// The extent along the main axis.
  /// Can be either a [num] (int/double) or [Spacing] enum.
  final Object extent;

  /// Optional color for debugging or visual purposes.
  final Color? color;

  /// Effective main axis extent in pixels.
  double get _effectiveMainAxisExtent {
    if (extent is num) return (extent as num).toDouble();
    if (extent is Spacing) return (extent as Spacing).value;
    return 0.0;
  }

  bool get hasExtent => _effectiveMainAxisExtent > 0;
  Spacing? get spacingType => extent is Spacing ? extent as Spacing : null;
  double? get numericExtent =>
      extent is num ? (extent as num).toDouble() : null;

  @override
  RenderSliverSpace createRenderObject(BuildContext context) {
    assert(
      extent is num || extent is Spacing,
      'extent must be either a num (int/double) or Spacing enum. Got: ${extent.runtimeType}',
    );

    if (extent is num) {
      final val = (extent as num).toDouble();
      assert(val >= 0, 'numeric extent must be non-negative. Got: $extent');
    }

    final effectiveExtent = _effectiveMainAxisExtent;
    return RenderSliverSpace(
      mainAxisExtent: effectiveExtent,
      color: color,
      maxExtent: effectiveExtent,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSliverSpace renderObject,
  ) {
    final effectiveExtent = _effectiveMainAxisExtent;
    renderObject
      ..mainAxisExtent = effectiveExtent
      ..color = color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    if (extent is num) {
      properties.add(DoubleProperty('extent', (extent as num).toDouble()));
    } else if (extent is Spacing) {
      properties.add(EnumProperty<Spacing>('extent', extent as Spacing));
    } else {
      properties.add(DiagnosticsProperty<Object>('extent', extent));
    }

    properties.add(DoubleProperty('effectiveExtent', _effectiveMainAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(
      FlagProperty('hasExtent', value: hasExtent, ifFalse: 'zero extent'),
    );
  }
}

/// A sliver that creates flexible space in a scrollable area.
/// Currently uses minExtent as fixed space.
class SliverFlexibleSpace extends LeafRenderObjectWidget {
  const SliverFlexibleSpace({
    super.key,
    this.minExtent = 0,
    this.maxExtent = double.infinity,
    this.color,
  }) : assert(minExtent >= 0, 'minExtent must be non-negative'),
       assert(maxExtent >= minExtent, 'maxExtent must be >= minExtent');

  final double minExtent;
  final double maxExtent;
  final Color? color;

  @override
  RenderSliverSpace createRenderObject(BuildContext context) {
    return RenderSliverSpace(
      mainAxisExtent: minExtent,
      color: color,
      maxExtent: minExtent,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSliverSpace renderObject,
  ) {
    renderObject
      ..mainAxisExtent = minExtent
      ..color = color;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('minExtent', minExtent));
    properties.add(DoubleProperty('maxExtent', maxExtent));
    properties.add(ColorProperty('color', color));
  }
}