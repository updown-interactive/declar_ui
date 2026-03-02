// ------------------------------------------------------------ //
//  material_app.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [MaterialApp] widget that supports
/// **fluent-style modifiers** for configuration.
///
/// This allows you to express app-level configuration declaratively,
/// similar to SwiftUI’s `App` or Compose’s `MaterialTheme`.
///
/// Example:
/// ```dart
/// MaterialApp()
///   .title('Declar UI')
///   .theme(ThemeData(primarySwatch: Colors.indigo))
///   .darkTheme(ThemeData.dark())
///   .themeMode(ThemeMode.system)
///   .routerConfig(appRouter)
///   .home(const HomePage());
/// ```
class MaterialApp extends material.StatelessWidget {
  final String? _title;
  final material.ThemeData? _theme;
  final material.ThemeData? _darkTheme;
  final material.ThemeMode? _themeMode;
  final material.Widget? _home;
  final Map<String, material.WidgetBuilder>? _routes;
  final material.RouteFactory? _onGenerateRoute;
  final material.RouteFactory? _onUnknownRoute;
  final material.Locale? _locale;
  final Iterable<material.LocalizationsDelegate<dynamic>>?
      _localizationsDelegates;
  final Iterable<material.Locale>? _supportedLocales;
  final material.TransitionBuilder? _builder;
  final bool _debugShowCheckedModeBanner;
  final material.GlobalKey<material.NavigatorState>? _navigatorKey;
  final material.RouterConfig<Object>? _routerConfig;

  /// Creates a declarative [MaterialApp].
  const MaterialApp({
    super.key,
    String? title,
    material.ThemeData? theme,
    material.ThemeData? darkTheme,
    material.ThemeMode? themeMode,
    material.Widget? home,
    Map<String, material.WidgetBuilder>? routes,
    material.RouteFactory? onGenerateRoute,
    material.RouteFactory? onUnknownRoute,
    material.Locale? locale,
    Iterable<material.LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Iterable<material.Locale>? supportedLocales,
    material.TransitionBuilder? builder,
    bool debugShowCheckedModeBanner = true,
    material.GlobalKey<material.NavigatorState>? navigatorKey,
    material.RouterConfig<Object>? routerConfig,
  })  : _title = title,
        _theme = theme,
        _darkTheme = darkTheme,
        _themeMode = themeMode,
        _home = home,
        _routes = routes,
        _onGenerateRoute = onGenerateRoute,
        _onUnknownRoute = onUnknownRoute,
        _locale = locale,
        _localizationsDelegates = localizationsDelegates,
        _supportedLocales = supportedLocales,
        _builder = builder,
        _debugShowCheckedModeBanner = debugShowCheckedModeBanner,
        _navigatorKey = navigatorKey,
        _routerConfig = routerConfig;

  /// Immutable copy helper for fluent chaining.
  MaterialApp _copyWith({
    String? title,
    material.ThemeData? theme,
    material.ThemeData? darkTheme,
    material.ThemeMode? themeMode,
    material.Widget? home,
    Map<String, material.WidgetBuilder>? routes,
    material.RouteFactory? onGenerateRoute,
    material.RouteFactory? onUnknownRoute,
    material.Locale? locale,
    Iterable<material.LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Iterable<material.Locale>? supportedLocales,
    material.TransitionBuilder? builder,
    bool? debugShowCheckedModeBanner,
    material.GlobalKey<material.NavigatorState>? navigatorKey,
    material.RouterConfig<Object>? routerConfig,
  }) {
    return MaterialApp(
      key: key,
      title: title ?? _title,
      theme: theme ?? _theme,
      darkTheme: darkTheme ?? _darkTheme,
      themeMode: themeMode ?? _themeMode,
      home: home ?? _home,
      routes: routes ?? _routes,
      onGenerateRoute: onGenerateRoute ?? _onGenerateRoute,
      onUnknownRoute: onUnknownRoute ?? _onUnknownRoute,
      locale: locale ?? _locale,
      localizationsDelegates: localizationsDelegates ?? _localizationsDelegates,
      supportedLocales: supportedLocales ?? _supportedLocales,
      builder: builder ?? _builder,
      debugShowCheckedModeBanner:
          debugShowCheckedModeBanner ?? _debugShowCheckedModeBanner,
      navigatorKey: navigatorKey ?? _navigatorKey,
      routerConfig: routerConfig ?? _routerConfig,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp.router(
      key: key,
      title: _title ?? '',
      theme: _theme,
      darkTheme: _darkTheme,
      themeMode: _themeMode ?? material.ThemeMode.system,
      locale: _locale,
      localizationsDelegates: _localizationsDelegates,
      supportedLocales:
          _supportedLocales ?? const [material.Locale('en', 'US')],
      builder: _builder,
      debugShowCheckedModeBanner: _debugShowCheckedModeBanner,
      routerConfig: _routerConfig,
    );
  }
}

// MARK: - Extension

/// Provides **chainable configuration modifiers** for the declarative [MaterialApp].
extension MaterialAppExtension on MaterialApp {
  /// Sets the title of the app (used by Android/iOS task switchers).
  MaterialApp title(String title) => _copyWith(title: title);

  /// Sets the light theme for the app.
  MaterialApp theme(material.ThemeData theme) => _copyWith(theme: theme);

  /// Sets the dark theme for the app.
  MaterialApp darkTheme(material.ThemeData theme) =>
      _copyWith(darkTheme: theme);

  /// Sets how the app adapts to system or user theme.
  MaterialApp themeMode(material.ThemeMode mode) => _copyWith(themeMode: mode);

  /// Sets the home screen widget.
  MaterialApp home(material.Widget home) => _copyWith(home: home);

  /// Adds named routes to the app (Navigator 1.0).
  MaterialApp routes(Map<String, material.WidgetBuilder> routes) =>
      _copyWith(routes: routes);

  /// Adds router configuration (Navigator 2.0 / go_router).
  MaterialApp routerConfig(material.RouterConfig<Object> config) =>
      _copyWith(routerConfig: config);

  /// Enables or disables the “debug” banner in the corner.
  MaterialApp debugBanner(bool show) =>
      _copyWith(debugShowCheckedModeBanner: show);

  /// Sets the app’s locale.
  MaterialApp locale(material.Locale locale) => _copyWith(locale: locale);

  /// Defines a builder for custom transitions or wrappers.
  MaterialApp builder(material.TransitionBuilder builder) =>
      _copyWith(builder: builder);

  /// Sets a custom [NavigatorState] key for advanced navigation control.
  MaterialApp navigator(material.GlobalKey<material.NavigatorState> keyValue) =>
      _copyWith(navigatorKey: keyValue);
}
