// ------------------------------------------------------------ //
//  scaffold.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Scaffold] widget that supports
/// composable, chainable syntax — inspired by SwiftUI.
///
/// It allows you to express app structure more **readably and fluently**, 
/// combining body, app bar, floating buttons, drawers, and more 
/// in a single declarative expression.
///
/// Example:
/// ```dart
/// Scaffold()
///   .body(Center(Text('Hello DeclarUI!')))
///   .backgroundColor(Colors.grey[100])
///   .floatingAction(FloatingActionButton(onPressed: () {}));
/// ```
class Scaffold extends material.StatelessWidget {
  final material.Widget? _body;
  final material.PreferredSizeWidget? _appBar;
  final material.Widget? _floatingActionButton;
  final material.FloatingActionButtonLocation? _floatingActionButtonLocation;
  final material.FloatingActionButtonAnimator? _floatingActionButtonAnimator;
  final material.Widget? _drawer;
  final material.Widget? _endDrawer;
  final material.Color? _backgroundColor;
  final material.Widget? _bottomNavigationBar;
  final material.Widget? _bottomSheet;
  final bool _resizeToAvoidBottomInset;
  final bool _extendBody;
  final bool _extendBodyBehindAppBar;

  /// Creates a declarative [Scaffold].
  const Scaffold({
    super.key,
    material.Widget? body,
    material.PreferredSizeWidget? appBar,
    material.Widget? floatingActionButton,
    material.FloatingActionButtonLocation? floatingActionButtonLocation,
    material.FloatingActionButtonAnimator? floatingActionButtonAnimator,
    material.Widget? drawer,
    material.Widget? endDrawer,
    material.Color? backgroundColor,
    material.Widget? bottomNavigationBar,
    material.Widget? bottomSheet,
    bool resizeToAvoidBottomInset = true,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
  })  : _body = body,
        _appBar = appBar,
        _floatingActionButton = floatingActionButton,
        _floatingActionButtonLocation = floatingActionButtonLocation,
        _floatingActionButtonAnimator = floatingActionButtonAnimator,
        _drawer = drawer,
        _endDrawer = endDrawer,
        _backgroundColor = backgroundColor,
        _bottomNavigationBar = bottomNavigationBar,
        _bottomSheet = bottomSheet,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _extendBody = extendBody,
        _extendBodyBehindAppBar = extendBodyBehindAppBar;

  /// Internal immutable copy helper.
  Scaffold _copyWith({
    material.Widget? body,
    material.PreferredSizeWidget? appBar,
    material.Widget? floatingActionButton,
    material.FloatingActionButtonLocation? floatingActionButtonLocation,
    material.FloatingActionButtonAnimator? floatingActionButtonAnimator,
    material.Widget? drawer,
    material.Widget? endDrawer,
    material.Color? backgroundColor,
    material.Widget? bottomNavigationBar,
    material.Widget? bottomSheet,
    bool? resizeToAvoidBottomInset,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
  }) {
    return Scaffold(
      key: key,
      body: body ?? _body,
      appBar: appBar ?? _appBar,
      floatingActionButton: floatingActionButton ?? _floatingActionButton,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? _floatingActionButtonLocation,
      floatingActionButtonAnimator:
          floatingActionButtonAnimator ?? _floatingActionButtonAnimator,
      drawer: drawer ?? _drawer,
      endDrawer: endDrawer ?? _endDrawer,
      backgroundColor: backgroundColor ?? _backgroundColor,
      bottomNavigationBar: bottomNavigationBar ?? _bottomNavigationBar,
      bottomSheet: bottomSheet ?? _bottomSheet,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? _resizeToAvoidBottomInset,
      extendBody: extendBody ?? _extendBody,
      extendBodyBehindAppBar:
          extendBodyBehindAppBar ?? _extendBodyBehindAppBar,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      key: key,
      appBar: _appBar,
      body: _body,
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: _floatingActionButtonLocation,
      floatingActionButtonAnimator: _floatingActionButtonAnimator,
      drawer: _drawer,
      endDrawer: _endDrawer,
      backgroundColor: _backgroundColor,
      bottomNavigationBar: _bottomNavigationBar,
      bottomSheet: _bottomSheet,
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
      extendBody: _extendBody,
      extendBodyBehindAppBar: _extendBodyBehindAppBar,
    );
  }
}

// MARK: - Extension

/// Provides expressive, chainable modifiers for the [Scaffold] widget.
///
/// These extensions mirror Flutter’s `Scaffold` properties in a declarative,
/// fluent way.
///
/// Example:
/// ```dart
/// Scaffold()
///   .body(Center(Text('Hello')))
///   .appBar(AppBar(title: Text('DeclarUI')))
///   .backgroundColor(Colors.white);
/// ```
extension ScaffoldExtension on Scaffold {
  /// Sets the main [body] of the Scaffold.
  Scaffold body(material.Widget? body) => _copyWith(body: body);

  /// Sets the [AppBar] of the Scaffold.
  Scaffold appBar(material.PreferredSizeWidget? appBar) =>
      _copyWith(appBar: appBar);

  /// Sets a [FloatingActionButton] for the Scaffold.
  Scaffold floatingAction(material.Widget? button) =>
      _copyWith(floatingActionButton: button);

  /// Sets the location of the floating action button.
  Scaffold floatingActionLocation(
          material.FloatingActionButtonLocation? location) =>
      _copyWith(floatingActionButtonLocation: location);

  /// Sets a [Drawer] for the Scaffold.
  Scaffold drawer(material.Widget? drawer) => _copyWith(drawer: drawer);

  /// Sets an [endDrawer] for the Scaffold.
  Scaffold endDrawer(material.Widget? endDrawer) =>
      _copyWith(endDrawer: endDrawer);

  /// Sets the background color of the Scaffold.
  Scaffold backgroundColor(material.Color? color) =>
      _copyWith(backgroundColor: color);

  /// Sets a [BottomNavigationBar] widget.
  Scaffold bottomNavigation(material.Widget? bar) =>
      _copyWith(bottomNavigationBar: bar);

  /// Sets a [BottomSheet] widget.
  Scaffold bottomSheet(material.Widget? sheet) =>
      _copyWith(bottomSheet: sheet);

  /// Determines whether the Scaffold resizes when the keyboard appears.
  Scaffold resizeToAvoidBottomInset(bool value) =>
      _copyWith(resizeToAvoidBottomInset: value);

  /// Extends the body behind the app bar.
  Scaffold extendBehindAppBar(bool value) =>
      _copyWith(extendBodyBehindAppBar: value);

  /// Extends the body behind the navigation bar.
  Scaffold extendBody(bool value) => _copyWith(extendBody: value);
}
