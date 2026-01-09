// ------------------------------------------------------------
//  color_extension.dart
//
//  Created by Siva Sankar on 2025-01-09.
// ------------------------------------------------------------

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Extension methods for [Color] that provide expressive,
/// chainable color manipulation and utility methods.
///
/// Enables a **SwiftUI-like, composable API** for working with colors.
///
/// ### Example
/// ```dart
/// final myColor = Colors.blue
///   .opacity(0.5)
///   .darken(0.2)
///   .saturate(0.3);
///
/// final textColor = myColor.isDark ? Colors.white : Colors.black;
/// ```
extension ColorExtension on Color {
  // ==================== Opacity ====================

  /// Returns a new color with the specified opacity (0.0 to 1.0).
  Color opacity(double opacity) => withValues(alpha: opacity.clamp(0.0, 1.0));

  /// Returns a semi-transparent version (50% opacity).
  Color get semiTransparent => opacity(0.5);

  /// Returns a fully opaque version.
  Color get opaque => opacity(1.0);

  /// Returns a barely visible version (10% opacity).
  Color get ghost => opacity(0.1);

  // ==================== Brightness Adjustments ====================

  /// Lightens the color by the specified amount (0.0 to 1.0).
  ///
  /// Example:
  /// ```dart
  /// final lighter = Colors.blue.lighten(0.2); // 20% lighter
  /// ```
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darkens the color by the specified amount (0.0 to 1.0).
  ///
  /// Example:
  /// ```dart
  /// final darker = Colors.blue.darken(0.2); // 20% darker
  /// ```
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Returns a brighter version by increasing RGB values.
  Color brighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.from(
      alpha: a,
      red: (r + ((1.0 - r) * amount)).clamp(0.0, 1.0),
      green: (g + ((1.0 - g) * amount)).clamp(0.0, 1.0),
      blue: (b + ((1.0 - b) * amount)).clamp(0.0, 1.0),
    );
  }

  /// Returns a dimmer version by decreasing RGB values.
  Color dim([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.from(
      alpha: a,
      red: (r * (1 - amount)).clamp(0.0, 1.0),
      green: (g * (1 - amount)).clamp(0.0, 1.0),
      blue: (b * (1 - amount)).clamp(0.0, 1.0),
    );
  }

  // ==================== Saturation ====================

  /// Increases saturation by the specified amount (0.0 to 1.0).
  Color saturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final saturation = (hsl.saturation + amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Decreases saturation by the specified amount (0.0 to 1.0).
  Color desaturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final saturation = (hsl.saturation - amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }

  /// Returns a completely grayscale version.
  Color get grayscale => desaturate(1.0);

  // ==================== Color Properties ====================

  /// Returns the HSL representation of this color.
  HSLColor get hsl => HSLColor.fromColor(this);

  /// Returns the HSV representation of this color.
  HSVColor get hsv => HSVColor.fromColor(this);

  /// Returns the luminance (perceived brightness) of the color.
  ///
  /// Value ranges from 0.0 (black) to 1.0 (white).
  double get luminance => computeLuminance();

  /// Returns true if this is a dark color (luminance < 0.5).
  bool get isDark => luminance < 0.5;

  /// Returns true if this is a light color (luminance >= 0.5).
  bool get isLight => luminance >= 0.5;

  // ==================== Complementary Colors ====================

  /// Returns the complementary color (opposite on color wheel).
  Color get complement {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + 180) % 360;
    return hsl.withHue(hue).toColor();
  }

  /// Returns the inverted color.
  Color get inverted {
    return Color.from(
      alpha: a,
      red: 1.0 - r,
      green: 1.0 - g,
      blue: 1.0 - b,
    );
  }

  // ==================== Color Harmony ====================

  /// Returns triadic colors (120° apart on color wheel).
  List<Color> get triadic {
    final hsl = HSLColor.fromColor(this);
    return [
      this,
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 240) % 360).toColor(),
    ];
  }

  /// Returns analogous colors (30° apart on color wheel).
  List<Color> get analogous {
    final hsl = HSLColor.fromColor(this);
    return [
      hsl.withHue((hsl.hue - 30) % 360).toColor(),
      this,
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
    ];
  }

  /// Returns split complementary colors.
  List<Color> get splitComplementary {
    final hsl = HSLColor.fromColor(this);
    return [
      this,
      hsl.withHue((hsl.hue + 150) % 360).toColor(),
      hsl.withHue((hsl.hue + 210) % 360).toColor(),
    ];
  }

  /// Returns tetradic colors (square on color wheel).
  List<Color> get tetradic {
    final hsl = HSLColor.fromColor(this);
    return [
      this,
      hsl.withHue((hsl.hue + 90) % 360).toColor(),
      hsl.withHue((hsl.hue + 180) % 360).toColor(),
      hsl.withHue((hsl.hue + 270) % 360).toColor(),
    ];
  }

  // ==================== Blending ====================

  /// Blends this color with another color.
  ///
  /// [ratio] determines the blend ratio (0.0 = this color, 1.0 = other color).
  Color blend(Color other, [double ratio = 0.5]) {
    assert(ratio >= 0 && ratio <= 1);
    return Color.from(
      alpha: ui.lerpDouble(a, other.a, ratio)!,
      red: ui.lerpDouble(r, other.r, ratio)!,
      green: ui.lerpDouble(g, other.g, ratio)!,
      blue: ui.lerpDouble(b, other.b, ratio)!,
    );
  }

  /// Mixes with white.
  Color tint([double amount = 0.1]) => blend(Colors.white, amount);

  /// Mixes with black.
  Color shade([double amount = 0.1]) => blend(Colors.black, amount);

  // ==================== Contrast & Accessibility ====================

  /// Returns an appropriate contrasting color (white or black)
  /// for text on this background color.
  Color get contrastingTextColor => isDark ? Colors.white : Colors.black;

  /// Calculates contrast ratio with another color (WCAG standard).
  ///
  /// Returns a value from 1 to 21.
  /// - 4.5:1 is minimum for normal text (WCAG AA)
  /// - 7:1 is enhanced contrast (WCAG AAA)
  double contrastRatio(Color other) {
    final l1 = luminance;
    final l2 = other.luminance;
    final lighter = l1 > l2 ? l1 : l2;
    final darker = l1 > l2 ? l2 : l1;
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Returns true if this color has sufficient contrast with another
  /// for normal text (WCAG AA: 4.5:1).
  bool hasGoodContrast(Color other) => contrastRatio(other) >= 4.5;

  /// Returns true if this color has enhanced contrast with another
  /// for normal text (WCAG AAA: 7:1).
  bool hasGreatContrast(Color other) => contrastRatio(other) >= 7.0;

  // ==================== Conversions ====================

  /// Returns the hex string representation (e.g., "#FF5733").
  String get hexString {
    final red = (r * 255).round().toRadixString(16).padLeft(2, '0');
    final green = (g * 255).round().toRadixString(16).padLeft(2, '0');
    final blue = (b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$red$green$blue'.toUpperCase();
  }

  /// Returns the hex string with alpha (e.g., "#80FF5733").
  String get hexStringWithAlpha {
    final alpha = (a * 255).round().toRadixString(16).padLeft(2, '0');
    final red = (r * 255).round().toRadixString(16).padLeft(2, '0');
    final green = (g * 255).round().toRadixString(16).padLeft(2, '0');
    final blue = (b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$alpha$red$green$blue'.toUpperCase();
  }

  /// Returns the RGB string representation (e.g., "rgb(255, 87, 51)").
  String get rgbString {
    final red = (r * 255).round();
    final green = (g * 255).round();
    final blue = (b * 255).round();
    return 'rgb($red, $green, $blue)';
  }

  /// Returns the RGBA string representation (e.g., "rgba(255, 87, 51, 0.5)").
  String get rgbaString {
    final red = (r * 255).round();
    final green = (g * 255).round();
    final blue = (b * 255).round();
    return 'rgba($red, $green, $blue, ${a.toStringAsFixed(2)})';
  }

  // ==================== Material Shade Generation ====================

  /// Generates a material-style color swatch with shades from 50 to 900.
  MaterialColor toMaterialColor() {
    final primaryValue = ((a * 255).round() << 24) |
        ((r * 255).round() << 16) |
        ((g * 255).round() << 8) |
        (b * 255).round();

    return MaterialColor(primaryValue, {
      50: tint(0.9),
      100: tint(0.7),
      200: tint(0.5),
      300: tint(0.3),
      400: tint(0.1),
      500: this,
      600: shade(0.1),
      700: shade(0.2),
      800: shade(0.3),
      900: shade(0.4),
    });
  }

  /// Generates a list of lighter shades.
  List<Color> generateLighterShades([int count = 5]) {
    return List.generate(
      count,
      (i) => lighten((i + 1) * (1.0 / (count + 1))),
    );
  }

  /// Generates a list of darker shades.
  List<Color> generateDarkerShades([int count = 5]) {
    return List.generate(
      count,
      (i) => darken((i + 1) * (1.0 / (count + 1))),
    );
  }

  // ==================== Temperature ====================

  /// Makes the color warmer by shifting hue towards orange/red.
  Color warm([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue - (30 * amount)) % 360;
    return hsl.withHue(hue).toColor();
  }

  /// Makes the color cooler by shifting hue towards blue.
  Color cool([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + (30 * amount)) % 360;
    return hsl.withHue(hue).toColor();
  }

  // ==================== Utility ====================

  /// Rotates the hue by the specified degrees.
  Color rotateHue(double degrees) {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + degrees) % 360;
    return hsl.withHue(hue).toColor();
  }

  /// Sets a specific hue value (0-360).
  Color withHue(double hue) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withHue(hue % 360).toColor();
  }

  /// Sets a specific saturation value (0.0-1.0).
  Color withSaturation(double saturation) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withSaturation(saturation.clamp(0.0, 1.0)).toColor();
  }

  /// Sets a specific lightness value (0.0-1.0).
  Color withLightness(double lightness) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness(lightness.clamp(0.0, 1.0)).toColor();
  }
}

// ==================== Color Factory Extension ====================

/// Extension on [Color] for creating colors from different formats.
extension ColorFactory on Color {
  /// Creates a color from a hex string.
  ///
  /// Supports formats:
  /// - "#RGB" (e.g., "#F00")
  /// - "#RRGGBB" (e.g., "#FF0000")
  /// - "#AARRGGBB" (e.g., "#80FF0000")
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 4) {
      // #RGB -> #RRGGBB
      buffer.write('ff');
      buffer.write(hexString[1]);
      buffer.write(hexString[1]);
      buffer.write(hexString[2]);
      buffer.write(hexString[2]);
      buffer.write(hexString[3]);
      buffer.write(hexString[3]);
    } else if (hexString.length == 7) {
      // #RRGGBB -> #AARRGGBB
      buffer.write('ff');
      buffer.write(hexString.substring(1));
    } else if (hexString.length == 9) {
      // #AARRGGBB
      buffer.write(hexString.substring(1));
    } else {
      throw ArgumentError('Invalid hex color: $hexString');
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Creates a color from RGB values (0-255).
  static Color fromRGB(int red, int green, int blue, [int alpha = 255]) {
    return Color.from(
      alpha: alpha / 255.0,
      red: red / 255.0,
      green: green / 255.0,
      blue: blue / 255.0,
    );
  }

  /// Creates a color from normalized RGB values (0.0-1.0).
  static Color fromRGBNormalized(
    double red,
    double green,
    double blue, [
    double alpha = 1.0,
  ]) {
    return Color.from(
      alpha: alpha.clamp(0.0, 1.0),
      red: red.clamp(0.0, 1.0),
      green: green.clamp(0.0, 1.0),
      blue: blue.clamp(0.0, 1.0),
    );
  }

  /// Creates a color from HSL values.
  ///
  /// - [hue]: 0-360
  /// - [saturation]: 0.0-1.0
  /// - [lightness]: 0.0-1.0
  /// - [alpha]: 0.0-1.0
  static Color fromHSL(
    double hue,
    double saturation,
    double lightness, [
    double alpha = 1.0,
  ]) {
    return HSLColor.fromAHSL(alpha, hue, saturation, lightness).toColor();
  }

  /// Creates a color from HSV values.
  ///
  /// - [hue]: 0-360
  /// - [saturation]: 0.0-1.0
  /// - [value]: 0.0-1.0
  /// - [alpha]: 0.0-1.0
  static Color fromHSV(
    double hue,
    double saturation,
    double value, [
    double alpha = 1.0,
  ]) {
    return HSVColor.fromAHSV(alpha, hue, saturation, value).toColor();
  }
}
