// ------------------------------------------------------------ //
//  constants.dart
//
//  Created by Siva Sankar on 2025-11-12.
// ------------------------------------------------------------ //

import 'package:declar_ui/declar_ui.dart';


abstract class DSize {
  /// Base spacing unit (8.0).
  /// All other spacing values are derived from this.
  static const double base = 8.0;

  // ----------------------------
  // Scale-based spacing
  // ----------------------------

  /// Extra small spacing (4.0).
  static const double xs = base * 0.5;

  /// Small spacing (8.0).
  static const double sm = base;

  /// Medium spacing (16.0).
  static const double md = base * 2;

  /// Large spacing (24.0).
  static const double lg = base * 3;

  /// Extra large spacing (32.0).
  static const double xl = base * 4;

  /// Double extra large spacing (40.0).
  static const double xxl = base * 5;

  /// Triple extra large spacing (48.0).
  static const double xxxl = base * 6;

  // ----------------------------
  // Semantic spacing
  // ----------------------------

  /// Tiny spacing alias (4.0).
  static const double tiny = xs;

  /// Small spacing alias (8.0).
  static const double small = sm;

  /// Medium spacing alias (16.0).
  static const double medium = md;

  /// Large spacing alias (24.0).
  static const double large = lg;

  /// Extra large spacing alias (32.0).
  static const double extraLarge = xl;

  // ----------------------------
  // Component-specific spacing
  // ----------------------------

  /// Default padding for buttons.
  static const double buttonPadding = md;

  /// Default padding for cards.
  static const double cardPadding = md;

  /// Default padding for sections or containers.
  static const double sectionPadding = lg;

  /// Default padding for screens.
  static const double screenPadding = md;

  /// Default padding for list items.
  static const double listItemPadding = md;

  // ----------------------------
  // Vertical spacing
  // ----------------------------

  /// Vertical tiny spacing (4.0).
  static const double verticalTiny = xs;

  /// Vertical small spacing (8.0).
  static const double verticalSmall = sm;

  /// Vertical medium spacing (16.0).
  static const double verticalMedium = md;

  /// Vertical large spacing (24.0).
  static const double verticalLarge = lg;

  /// Vertical extra large spacing (32.0).
  static const double verticalExtraLarge = xl;

  // ----------------------------
  // Horizontal spacing
  // ----------------------------

  /// Horizontal tiny spacing (4.0).
  static const double horizontalTiny = xs;

  /// Horizontal small spacing (8.0).
  static const double horizontalSmall = sm;

  /// Horizontal medium spacing (16.0).
  static const double horizontalMedium = md;

  /// Horizontal large spacing (24.0).
  static const double horizontalLarge = lg;

  /// Horizontal extra large spacing (32.0).
  static const double horizontalExtraLarge = xl;
}


class DRadius {
  // ----------------------------
  // Base radius
  // ----------------------------

  /// No radius (0.0).
  static const double none = 0.0;

  /// Extra small radius (4.0).
  static const double xs = 4.0;

  /// Small radius (8.0).
  static const double sm = 8.0;

  /// Medium radius (12.0).
  static const double md = 12.0;

  /// Large radius (16.0).
  static const double lg = 16.0;

  /// Extra large radius (20.0).
  static const double xl = 20.0;

  /// Double extra large radius (24.0).
  static const double xxl = 24.0;

  /// Triple extra large radius (32.0).
  static const double xxxl = 32.0;

  // ----------------------------
  // Semantic radius
  // ----------------------------

  /// Semantic alias for small radius (4.0).
  static const double small = xs;

  /// Semantic alias for medium radius (8.0).
  static const double medium = sm;

  /// Semantic alias for large radius (12.0).
  static const double large = md;

  /// Semantic alias for extra large radius (16.0).
  static const double extraLarge = lg;

  // ----------------------------
  // Component-specific radius
  // ----------------------------

  /// Default button radius (8.0).
  static const double button = sm;

  /// Default card radius (12.0).
  static const double card = md;

  /// Default text field radius (8.0).
  static const double textField = sm;

  /// Default dialog radius (16.0).
  static const double dialog = lg;

  /// Default bottom sheet radius (16.0).
  static const double bottomSheet = lg;

  /// Default chip radius (20.0).
  static const double chip = xl;

  /// Default avatar radius (24.0).
  static const double avatar = xxl;

  // ----------------------------
  // Special radius
  // ----------------------------

  /// Full circular radius (999.0) for pills or circles.
  static const double circular = 999.0;

  // ----------------------------
  // BorderRadius objects
  // ----------------------------

  /// Border radius of 0.0.
  static const BorderRadius noneRadius = BorderRadius.all(
    Radius.circular(none),
  );

  /// Border radius of 4.0.
  static const BorderRadius xsRadius = BorderRadius.all(Radius.circular(xs));

  /// Border radius of 8.0.
  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));

  /// Border radius of 12.0.
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));

  /// Border radius of 16.0.
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));

  /// Border radius of 20.0.
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));

  /// Border radius of 24.0.
  static const BorderRadius xxlRadius = BorderRadius.all(Radius.circular(xxl));

  /// Border radius of 32.0.
  static const BorderRadius xxxlRadius = BorderRadius.all(
    Radius.circular(xxxl),
  );

  /// Circular border radius (999.0).
  static const BorderRadius circularRadius = BorderRadius.all(
    Radius.circular(circular),
  );

  // ----------------------------
  // Component BorderRadius
  // ----------------------------

  /// Border radius for buttons.
  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(button),
  );

  /// Border radius for cards.
  static const BorderRadius cardRadius = BorderRadius.all(
    Radius.circular(card),
  );

  /// Border radius for text fields.
  static const BorderRadius textFieldRadius = BorderRadius.all(
    Radius.circular(textField),
  );

  /// Border radius for dialogs.
  static const BorderRadius dialogRadius = BorderRadius.all(
    Radius.circular(dialog),
  );

  /// Border radius for bottom sheets (rounded only at the top).
  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );

  /// Border radius for chips.
  static const BorderRadius chipRadius = BorderRadius.all(
    Radius.circular(chip),
  );
}