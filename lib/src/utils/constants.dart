// ------------------------------------------------------------ //
//  constants.dart
//
//  Created by Siva Sankar on 2025-11-12.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SPACING TOKENS
/// ---------------------------------------------------------------------------
///
/// Design spacing tokens used across layouts and components.
///
/// All spacing values are derived from a single base unit to ensure
/// visual consistency and predictable scaling across the UI.
///
/// Prefer **intent-based spacing** (normal, relaxed, spacious)
/// over numeric scale when possible.
abstract class DSpacing {
  /// Base spacing unit (8.0).
  ///
  /// Acts as the foundational grid unit for the design system.
  static const double unit = 8.0;

  // ---------------------------------------------------------------------------
  // Numeric scale (precise control)
  // ---------------------------------------------------------------------------

  /// 4.0 — Very small spacing.
  static const double xSmall = unit * 0.5;

  /// 8.0 — Small spacing.
  static const double small = unit;

  /// 16.0 — Medium spacing.
  static const double medium = unit * 2;

  /// 24.0 — Large spacing.
  static const double large = unit * 3;

  /// 32.0 — Extra large spacing.
  static const double xLarge = unit * 4;

  /// 40.0 — Double extra large spacing.
  static const double xxLarge = unit * 5;

  /// 48.0 — Triple extra large spacing.
  static const double xxxLarge = unit * 6;

  // ---------------------------------------------------------------------------
  // Intent-based spacing (recommended)
  // ---------------------------------------------------------------------------

  /// Minimal spacing between closely related elements.
  static const double tight = xSmall;

  /// Default spacing between most UI elements.
  static const double normal = medium;

  /// Comfortable spacing for grouped content or sections.
  static const double relaxed = large;

  /// Large separation for major layout sections.
  static const double spacious = xLarge;

  // ---------------------------------------------------------------------------
  // Layout & component spacing
  // ---------------------------------------------------------------------------

  /// Standard horizontal padding for screens.
  static const double screenHorizontal = medium;

  /// Standard vertical padding for screens.
  static const double screenVertical = medium;

  /// Padding inside cards, surfaces, and containers.
  static const double surfacePadding = medium;

  /// Padding inside list items.
  static const double listItemPadding = medium;

  /// Padding inside buttons.
  static const double buttonPadding = small;

  /// Vertical gap between stacked elements.
  static const double verticalGap = medium;

  /// Horizontal gap between inline elements.
  static const double horizontalGap = medium;
}

/// ---------------------------------------------------------------------------
/// RADIUS TOKENS
/// ---------------------------------------------------------------------------
///
/// Radius tokens define the rounding style used throughout the UI.
///
/// Prefer **intent-based radius** (standard, emphasized)
/// to maintain consistent visual language.
abstract class DRadius {
  // ---------------------------------------------------------------------------
  // Numeric radius scale
  // ---------------------------------------------------------------------------

  /// No rounding.
  static const double none = 0.0;

  /// Very subtle rounding.
  static const double subtle = 4.0;

  /// Small rounding.
  static const double small = 8.0;

  /// Medium rounding.
  static const double medium = 12.0;

  /// Large rounding.
  static const double large = 16.0;

  /// Extra large rounding.
  static const double xLarge = 20.0;

  /// Double extra large rounding.
  static const double xxLarge = 24.0;

  /// Fully rounded value for pills, circles, and avatars.
  static const double full = 999.0;

  // ---------------------------------------------------------------------------
  // Intent-based radius (recommended)
  // ---------------------------------------------------------------------------

  /// Soft rounding for low-emphasis elements.
  static const double soft = subtle;

  /// Standard rounding for most UI components.
  static const double standard = small;

  /// Emphasized rounding for surfaces and cards.
  static const double emphasized = medium;

  // ---------------------------------------------------------------------------
  // Component radius defaults (guidance)
  // ---------------------------------------------------------------------------

  static const double button = small;
  static const double card = medium;
  static const double inputField = small;
  static const double dialog = large;
  static const double bottomSheet = large;
  static const double chip = xLarge;
  static const double avatar = xxLarge;

  // ---------------------------------------------------------------------------
  // BorderRadius helpers
  // ---------------------------------------------------------------------------

  static const BorderRadius noneRadius =
      BorderRadius.all(Radius.circular(none));

  static const BorderRadius smallRadius =
      BorderRadius.all(Radius.circular(small));

  static const BorderRadius mediumRadius =
      BorderRadius.all(Radius.circular(medium));

  static const BorderRadius largeRadius =
      BorderRadius.all(Radius.circular(large));

  static const BorderRadius fullRadius =
      BorderRadius.all(Radius.circular(full));

  // ---------------------------------------------------------------------------
  // Component BorderRadius helpers
  // ---------------------------------------------------------------------------

  static const BorderRadius buttonRadius =
      BorderRadius.all(Radius.circular(button));

  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(card));

  static const BorderRadius inputFieldRadius =
      BorderRadius.all(Radius.circular(inputField));

  static const BorderRadius dialogRadius =
      BorderRadius.all(Radius.circular(dialog));

  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(bottomSheet),
    topRight: Radius.circular(bottomSheet),
  );

  static const BorderRadius chipRadius =
      BorderRadius.all(Radius.circular(chip));
}
