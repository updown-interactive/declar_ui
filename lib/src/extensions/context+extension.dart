// ------------------------------------------------------------ //
//  context+extension.dart
// ------------------------------------------------------------ //

import 'package:flutter/material.dart';

/// Production-grade BuildContext extensions to reduce boilerplate.
extension DeclarativeContextExtension on BuildContext {
  // MARK: - Theme & Styling Shortcuts

  /// Get the closest [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// Get the closest [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the closest [ColorScheme]
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Check if the current theme is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // MARK: - MediaQuery & Sizing Shortcuts

  /// Get the closest [MediaQueryData]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get the screen width
  double get width => MediaQuery.sizeOf(this).width;

  /// Get the screen height
  double get height => MediaQuery.sizeOf(this).height;

  /// Get a percentage of screen width (0.0 to 1.0)
  double sw(double percentage) => width * percentage;

  /// Get a percentage of screen height (0.0 to 1.0)
  double sh(double percentage) => height * percentage;

  /// Get screen safe area padding
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Get bottom padding (often represents bottom system nav bar)
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;

  /// Get top padding (often represents status bar)
  double get topPadding => MediaQuery.paddingOf(this).top;

  /// Check if the keyboard is visible
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;

  // MARK: - Navigation Shortcuts

  /// Push a new widget onto the navigation stack
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this)
        .push<T>(MaterialPageRoute(builder: (context) => page));
  }

  /// Pop the top widget from the navigation stack
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Push a new widget and execute a replacement
  Future<T?> pushReplacement<T, TO>(Widget page, {TO? result}) {
    return Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (context) => page),
      result: result,
    );
  }

  /// Push a new widget and remove all underlying pages
  Future<T?> pushAndRemoveUntil<T>(
      Widget page, bool Function(Route<dynamic>) predicate) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (context) => page),
      predicate,
    );
  }

  // MARK: - Scaffold & Snackbars

  /// Shows a quick material [SnackBar].
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  // MARK: - Focus Management

  /// Unfocuses the current focus node, usually dismissing the keyboard.
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
