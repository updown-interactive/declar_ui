// ------------------------------------------------------------ //
//  screen.dart
//
//  Created by Siva Sankar on 2025-11-12.
// ------------------------------------------------------------ //

import 'dart:io';
import 'dart:ui';

import 'package:declar_ui/declar_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

extension ScreenDimensionExtension on BuildContext {
  /// Screen Dimension Properties
  /// Returns the full height of the screen in logical pixels
  double get maxHeight => getScreenHeight(this);

  /// Returns the full width of the screen in logical pixels
  double get maxWidth => getScreenWidth(this);

  /// Returns the aspect ratio of the screen (width/height)
  double get aspectRatio => getScreenAspectRatio(this);

  /// Returns the screen size as a Size object
  Size get screenSize => getScreenSize(this);

  /// Device Properties
  /// Returns the device pixel ratio
  double get pixelRatio => getDevicePixelRatio(this);

  /// Returns the logical pixel density
  double get density => getLogicalPixelDensity(this);

  /// Platform Brightness
  /// Returns the platform brightness
  Brightness get brightness => getPlatformBrightness(this);

  /// Checks if the device is in dark mode
  bool get isDarkMode => getIsDarkMode(this);

  /// Checks if the device is in light mode
  bool get isLightMode => getIsLightMode(this);

  /// Orientation
  /// Returns the current orientation
  Orientation get orientation => getOrientation(this);

  /// Checks if the device is in landscape orientation
  bool get isLandscape => getIsLandscape(this);

  /// Checks if the device is in portrait orientation
  bool get isPortrait => getIsPortrait(this);

  /// Padding and Insets
  /// Returns the safe area padding
  EdgeInsets get safeAreaPadding => getSafeAreaPadding(this);

  /// Returns the view insets (typically keyboard height when visible)
  EdgeInsets get viewInsets => getViewInsets(this);

  /// Returns the view padding
  EdgeInsets get viewPadding => getViewPadding(this);

  /// Returns the system gesture insets
  EdgeInsets get systemGestureInsets => getSystemGestureInsets(this);

  /// Status Bar and System UI
  /// Returns the status bar height
  double get statusBarHeight => getStatusBarHeight(this);

  /// Returns the bottom safe area height
  double get bottomSafeAreaHeight => getBottomSafeAreaHeight(this);

  /// Returns the keyboard height
  double get keyboardHeight => getKeyboardHeight(this);

  /// Checks if the keyboard is visible
  bool get isKeyboardVisible => getIsKeyboardVisible(this);

  /// Available Space (excluding system UI)
  /// Returns the available height excluding safe areas
  double get availableHeight => getAvailableHeight(this);

  /// Returns the available width excluding safe areas
  double get availableWidth => getAvailableWidth(this);

  /// Returns the usable height excluding keyboard and safe areas
  double get usableHeight => getUsableHeight(this);

  /// Accessibility
  /// Checks if bold text is enabled
  bool get isBoldTextEnabled => getIsBoldTextEnabled(this);

  /// Checks if accessible navigation is enabled
  bool get isAccessibleNavigation => getIsAccessibleNavigation(this);

  /// Checks if invert colors is enabled
  bool get isInvertColorsEnabled => getIsInvertColorsEnabled(this);

  /// Checks if high contrast is enabled
  bool get isHighContrastEnabled => getIsHighContrastEnabled(this);

  /// Checks if disable animations is enabled
  bool get isDisableAnimationsEnabled => getIsDisableAnimationsEnabled(this);

  /// Navigation Mode
  /// Returns the navigation mode
  NavigationMode get navigationMode => getNavigationMode(this);

  /// Checks if traditional navigation is enabled
  bool get isTraditionalNavigation => getIsTraditionalNavigation(this);

  /// Checks if directional navigation is enabled
  bool get isDirectionalNavigation => getIsDirectionalNavigation(this);

  /// Gesture Settings
  /// Returns the device gesture settings
  DeviceGestureSettings get gestureSettings => getGestureSettings(this);

  /// Display Features (for foldable devices)
  /// Returns the list of display features
  List<DisplayFeature> get displayFeatures => getDisplayFeatures(this);

  /// Checks if the device has foldable features
  bool get hasFoldableFeatures => getHasFoldableFeatures(this);

  /// Size Categories for Responsive Design
  /// Checks if the screen is small (< 600px width)
  bool get isSmallScreen => getIsSmallScreen(this);

  /// Checks if the screen is medium (600px-1200px width)
  bool get isMediumScreen => getIsMediumScreen(this);

  /// Checks if the screen is large (>= 1200px width)
  bool get isLargeScreen => getIsLargeScreen(this);

  /// Checks if the device is tablet size
  bool get isTabletSize => getIsTabletSize(this);

  /// Checks if the device is mobile size
  bool get isMobileSize => getIsMobileSize(this);

  // Checks if the device is mobile (width < 600) && Checks platform
  bool get isMobile => getIsMobile(this);

  // Checks if the device is tablet (width >= 600 && < 1024) && Checks platform
  bool get isTablet => getIsMobile(this);

  // Checks if the device is desktop (width >= 1024) && Checks platform
  bool get isDesktop => getIsDesktop(this);

  bool get isWeb => getIsWeb(this);

  /// System UI Overlap
  /// Checks if system UI overlaps content
  bool get doesSystemUIOverlapContent => getDoesSystemUIOverlapContent(this);

  /// Complete MediaQuery Data Access
  /// Returns the complete MediaQuery data
  MediaQueryData get mediaQueryData => getMediaQueryData(this);

  /// Returns all screen dimensions as a utility class
  ScreenDimensions get screenDimensions => ScreenDimensions.from(this);

  /// Additional Convenience Properties
  /// Returns the shorter side of the screen
  double get shortestSide => screenSize.shortestSide;

  /// Returns the longer side of the screen
  double get longestSide => screenSize.longestSide;

  /// Checks if the screen is wider than it is tall
  bool get isWideScreen => maxWidth > maxHeight;

  /// Checks if the screen is taller than it is wide
  bool get isTallScreen => maxHeight > maxWidth;

  /// Returns the center point of the screen
  Offset get screenCenter => Offset(maxWidth / 2, maxHeight / 2);

  /// Returns the diagonal size of the screen in logical pixels
  double get screenDiagonal => screenSize.longestSide;

  /// Checks if this is likely a phone in portrait mode
  bool get isPhonePortrait => isPortrait && isMobileSize;

  /// Checks if this is likely a phone in landscape mode
  bool get isPhoneLandscape => isLandscape && isMobileSize;

  /// Checks if this is likely a tablet in portrait mode
  bool get isTabletPortrait => isPortrait && isTabletSize;

  /// Checks if this is likely a tablet in landscape mode
  bool get isTabletLandscape => isLandscape && isTabletSize;

  /// Responsive Breakpoints
  /// Extra small screens (phones in portrait)
  bool get isXs => maxWidth < 576;

  /// Small screens (phones in landscape, small tablets)
  bool get isSm => maxWidth >= 576 && maxWidth < 768;

  /// Medium screens (tablets)
  bool get isMd => maxWidth >= 768 && maxWidth < 992;

  /// Large screens (small desktops)
  bool get isLg => maxWidth >= 992 && maxWidth < 1200;

  /// Extra large screens (large desktops)
  bool get isXl => maxWidth >= 1200;

  /// XXL screens (very large desktops)
  bool get isXxl => maxWidth >= 1400;

  /// Returns the current theme data.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme from the theme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current text theme from the theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current typography from the theme.
  Typography get typography => Theme.of(this).typography;
}

/// Screen Dimension Functions
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenAspectRatio(BuildContext context) {
  return MediaQuery.of(context).size.aspectRatio;
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Device Properties
double getDevicePixelRatio(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}

/// Platform Brightness
Brightness getPlatformBrightness(BuildContext context) {
  return MediaQuery.of(context).platformBrightness;
}

bool getIsDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

bool getIsLightMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}

/// Orientation
Orientation getOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}

bool getIsLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

bool getIsPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

/// Padding and Insets
EdgeInsets getSafeAreaPadding(BuildContext context) {
  return MediaQuery.of(context).padding;
}

EdgeInsets getViewInsets(BuildContext context) {
  return MediaQuery.of(context).viewInsets;
}

EdgeInsets getViewPadding(BuildContext context) {
  return MediaQuery.of(context).viewPadding;
}

EdgeInsets getSystemGestureInsets(BuildContext context) {
  return MediaQuery.of(context).systemGestureInsets;
}

/// Status Bar and System UI
double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double getBottomSafeAreaHeight(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}

double getKeyboardHeight(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

bool getIsKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 0;
}

/// Available Space (excluding system UI)
double getAvailableHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.height -
      mediaQuery.padding.top -
      mediaQuery.padding.bottom;
}

double getAvailableWidth(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.width -
      mediaQuery.padding.left -
      mediaQuery.padding.right;
}

double getUsableHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.height -
      mediaQuery.viewInsets.bottom -
      mediaQuery.padding.top -
      mediaQuery.padding.bottom;
}

/// Accessibility
bool getIsBoldTextEnabled(BuildContext context) {
  return MediaQuery.of(context).boldText;
}

bool getIsAccessibleNavigation(BuildContext context) {
  return MediaQuery.of(context).accessibleNavigation;
}

bool getIsInvertColorsEnabled(BuildContext context) {
  return MediaQuery.of(context).invertColors;
}

bool getIsHighContrastEnabled(BuildContext context) {
  return MediaQuery.of(context).highContrast;
}

bool getIsDisableAnimationsEnabled(BuildContext context) {
  return MediaQuery.of(context).disableAnimations;
}

/// Navigation Mode
NavigationMode getNavigationMode(BuildContext context) {
  return MediaQuery.of(context).navigationMode;
}

bool getIsTraditionalNavigation(BuildContext context) {
  return MediaQuery.of(context).navigationMode == NavigationMode.traditional;
}

bool getIsDirectionalNavigation(BuildContext context) {
  return MediaQuery.of(context).navigationMode == NavigationMode.directional;
}

/// Gesture Settings
DeviceGestureSettings getGestureSettings(BuildContext context) {
  return MediaQuery.of(context).gestureSettings;
}

/// Display Features (for foldable devices)
List<DisplayFeature> getDisplayFeatures(BuildContext context) {
  return MediaQuery.of(context).displayFeatures;
}

bool getHasFoldableFeatures(BuildContext context) {
  return MediaQuery.of(context).displayFeatures.isNotEmpty;
}

/// Size Categories for Responsive Design
bool getIsSmallScreen(BuildContext context) {
  return getScreenWidth(context) < 600;
}

bool getIsMediumScreen(BuildContext context) {
  final width = getScreenWidth(context);
  return width >= 600 && width < 1200;
}

bool getIsLargeScreen(BuildContext context) {
  return getScreenWidth(context) >= 1200;
}

bool getIsTabletSize(BuildContext context) {
  final size = getScreenSize(context);
  final shortestSide = size.shortestSide;
  return shortestSide >= 600;
}

bool getIsMobileSize(BuildContext context) {
  return !getIsTabletSize(context);
}

/// Density Information
double getLogicalPixelDensity(BuildContext context) {
  return MediaQuery.of(context).devicePixelRatio;
}

/// System UI Overlap
bool getDoesSystemUIOverlapContent(BuildContext context) {
  final padding = MediaQuery.of(context).padding;
  return padding.top > 0 || padding.bottom > 0;
}

/// Complete MediaQuery Data Access
MediaQueryData getMediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

/// Utility for getting all system dimensions at once
class ScreenDimensions {
  final Size size;
  final double devicePixelRatio;
  final EdgeInsets padding;
  final EdgeInsets viewInsets;
  final EdgeInsets viewPadding;
  final Orientation orientation;
  final Brightness brightness;

  ScreenDimensions({
    required this.size,
    required this.devicePixelRatio,
    required this.padding,
    required this.viewInsets,
    required this.viewPadding,
    required this.orientation,
    required this.brightness,
  });

  factory ScreenDimensions.from(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScreenDimensions(
      size: mediaQuery.size,
      devicePixelRatio: mediaQuery.devicePixelRatio,
      padding: mediaQuery.padding,
      viewInsets: mediaQuery.viewInsets,
      viewPadding: mediaQuery.viewPadding,
      orientation: mediaQuery.orientation,
      brightness: mediaQuery.platformBrightness,
    );
  }
}

bool getIsWeb(BuildContext context) {
  return kIsWeb;
}

bool getIsMobile(BuildContext context) {
  if (kIsWeb) return getScreenWidth(context) < 600;
  return Platform.isAndroid || Platform.isIOS;
}

bool getIsTablet(BuildContext context) {
  final width = getScreenWidth(context);
  if (kIsWeb) return width >= 600 && width < 1024;
  return (Platform.isAndroid || Platform.isIOS) && width >= 600;
}

bool getIsDesktop(BuildContext context) {
  if (kIsWeb) return getScreenWidth(context) >= 1024;
  return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
}
