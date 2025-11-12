// ------------------------------------------------------------ //
//  declar.dart
//
//  Created by Siva Sankar on 2025-11-11.
//  Improved DeclarUI lifecycle widget with chainable hooks.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative, stateful widget that supports inline lifecycle hooks
/// and chainable extensions — inspired by SwiftUI’s `.onAppear()` and `.onDisappear()`.
///
/// Example:
/// ```dart
/// Declar((context) => const Text('Hello DeclarUI'))
///     .onInit(() => print('Init'))
///     .onDispose(() => print('Dispose'));
/// ```
class Declar extends material.StatefulWidget {
  /// Called once when the widget is inserted into the widget tree.
  final void Function()? init;

  /// Called once when the widget is removed from the widget tree.
  final void Function()? dispose;

  /// Called whenever the widget is rebuilt (use sparingly).
  final void Function()? effect;

  /// The widget builder function.
  final material.Widget Function(material.BuildContext context) builder;

  const Declar(
    this.builder, {
    super.key,
    this.init,
    this.dispose,
    this.effect,
  });

  @override
  material.State<Declar> createState() => _DeclarState();
}

class _DeclarState extends material.State<Declar> {
  @override
  void initState() {
    super.initState();
    widget.init?.call();
  }

  @override
  void dispose() {
    widget.dispose?.call();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Declar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Effect hook for rebuild reactions
    if (widget.effect != null && oldWidget.builder != widget.builder) {
      widget.effect!.call();
    }
  }

  @override
  material.Widget build(material.BuildContext context) {
    return widget.builder(context);
  }
}

// MARK: - Extensions

/// Extension methods for chaining declarative lifecycle hooks.
///
/// Example:
/// ```dart
/// Declar((context) => const Text('DeclarUI'))
///     .onInit(() => print('Init'))
///     .onDispose(() => print('Dispose'))
///     .onEffect(() => print('Rebuilt'));
/// ```
extension DeclarLifecycleExtension on Declar {
  /// Runs a callback once when the widget is first inserted in the tree.
  Declar onInit(void Function() callback) {
    return Declar(
      builder,
      key: key,
      init: _chain(init, callback),
      dispose: dispose,
      effect: effect,
    );
  }

  /// Runs a callback once when the widget is removed from the tree.
  Declar onDispose(void Function() callback) {
    return Declar(
      builder,
      key: key,
      init: init,
      dispose: _chain(dispose, callback),
      effect: effect,
    );
  }

  /// Runs a callback whenever the widget rebuilds.
  Declar onEffect(void Function() callback) {
    return Declar(
      builder,
      key: key,
      init: init,
      dispose: dispose,
      effect: _chain(effect, callback),
    );
  }

  /// A convenience hook that runs `onInit` and `onDispose` callbacks.
  Declar onMount({
    void Function()? appear,
    void Function()? disappear,
  }) {
    return Declar(
      builder,
      key: key,
      init: _chain(init, appear),
      dispose: _chain(dispose, disappear),
      effect: effect,
    );
  }

  /// SwiftUI-style aliases for `.onInit()` and `.onDispose()`.
  Declar onAppear(void Function() callback) => onInit(callback);
  Declar onDisappear(void Function() callback) => onDispose(callback);

  // Helper: chains two functions safely.
  void Function()? _chain(void Function()? original, void Function()? next) {
    if (original == null) return next;
    if (next == null) return original;
    return () {
      original();
      next();
    };
  }
}
