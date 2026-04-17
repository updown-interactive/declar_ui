## **2.0.6**

* Upgraded SDK constraints for `flutter` to `>=3.41.7`.
* Added missing standard Flutter constructors to `declar_ui` widget wrappers:
  * `ListView`: Added `.separated` and `.custom` constructors.
  * `Image`: Added `.file` and `.memory` constructors.
  * `Text`: Added `.rich` for `TextSpan` support.
  * `Sliver`: Added `Sliver.listSeparated` factory.

---

## **2.0.5**

* Removed `Positioned` widget and exports.

---

## **2.0.4**

* Added `controller` support to the declarative `ListView` widget and builders.

---

## **2.0.3**

* Added `ListView.builder` directly to the `ListView` declarative wrapper for dynamic item streaming.
* Added `Sliver.listBuilder` factory to easily proxy infinite `SliverList.builder` patterns.
* Fixed property assignment bugs and linter warnings across `CustomScrollView`, `Wrap`, `Card`, `Positioned`, and `SafeArea`.

---

## **2.0.2**

* Resolved `BuildContext` property conflicts between `context+extension.dart` and `screen.dart`.
* Addressed `Container.backgroundColor()` failing test cases by aligning unit tests with the new `BoxDecoration` backend.

---

## **2.0.1**

* Upgraded SDK constraints for `flutter` to `>=3.41.0` and `dart` to `>=3.11.0` to ensure compatibility with the latest Flutter stable release.

---

## **2.0.0 — Comprehensive UI Toolkit & Production Utilities**

> This massive major update significantly expands the widget library with new declarative components, introduces a suite of production-grade extension utilities, and fundamentally refines the core layout widgets for better type-safety and syntax alignment.

---

### Highlights

* **[BREAKING]** `Column`, `Row`, and `Stack` syntax overhauled for stability.
* **New Declarative Widgets:** `Wrap`, `SafeArea`, `Positioned`, `Image`, `Card`, and `ListView`
* **Powerful BuildContext Extensions** for Theme, Sizing, Navigation, and SnackBar shortcuts
* **Iterable Utilities** including `mapIndexed`, `firstWhereOrNull`, `groupBy`, and array `.separated` widgets
* **Numeric Duration Extensions** for effortless delays and easy-to-read millisecond/second conversions
* **Advanced Widget Effects** like `blur()` (glassmorphism), `tooltip()`, and `unfocusOnTap()`
* **Sliver conversion** with `.asSliver()`

---

## New Features

### **New Components**

Six highly requested Flutter widgets have been wrapped with fluid, immutable declarative modifiers:

* **`Wrap`** — `.horizontal()`, `.vertical()`, `.spacing()`, `.runSpacing()`, etc.
* **`SafeArea`** — `.edges()`, `.all()`, `.bottom()`, `.none()`, etc.
* **`Positioned`** — Control all stack offsets via `.left()`, `.right()`, `.top()`, `.bottom()`, `.fill()`
* **`Image`** — Supports `Image.network()` and `Image.asset()` with easy `.fit()`, `.color()` and blending modifiers
* **`ListView`** — Control via `.horizontal()`, `.paddingAll()`, `.bouncing()`, `.shrinkWrap()`
* **`Card`** — Quickly configure `.color()`, `.elevation()`, `.rounded()`, `.marginSymmetric()`

### **Production Context Shortcuts**

`BuildContext` is now vastly more powerful, heavily reducing mapping code:

```dart
// Theming
context.theme
context.colors
context.textTheme
context.isDarkMode

// Viewport / Screen sizes
context.sw(0.5) // Gets 50% screen width
context.height
context.bottomPadding
context.isKeyboardVisible

// Quick Routing & Status
context.push(MyWidget())
context.pop()
context.showSnackBar('Saved!')
context.hideKeyboard()
```

### **Iterable & Widget Arrays**

Handle mapping and list construction easily via our new `Iterable` injections:

```dart
// Auto-inject spacing between widgets
Row.children([Text('A'), Text('B')].separated(Space(width: 8)))

// Map items with their indexes
myList.mapIndexed((index, item) => Text('$index: $item'))

// Safe nullable searching
var target = myList.firstWhereOrNull((item) => item.isValid);

// Grouping
var sortedDict = objects.groupBy((item) => item.category);
```

### **Advanced UI Effects**

Added highly sought-after capabilities directly onto `Widget`:

* **`.blur(sigmaX: 10, sigmaY: 10, borderRadius: ...)`** — Instantly applies a BackDropFilter for rapid glassmorphism UI builds.
* **`.tooltip('Hold to edit')`** — Automatic semantic tooltip wrapping.
* **`.unfocusOnTap(context)`** — Wrap any layout in this to automatically dismiss the keyboard when the user taps whitespace.
* **`.asSliver()`** — Morph standard widgets into slivers instantly! (`SliverToBoxAdapter`).

### **Time & Delays**

```dart
await 2.seconds.delay(); // Native dart int extensions

// Create durations smoothly
500.milliseconds
1.minutes
```

---

## ⚠️ Breaking Changes (Migration Guide)

In an effort to standardize layout semantics alongside native Flutter alignment properties, the syntax for **`Row`**, **`Column`**, and **`Stack`** has been updated to require named constructors or explicit parameters.

**Previous Syntax (1.x):**
```dart
Column([
  Text('Item 1'),
  Text('Item 2'),
])

Row([
  Icon(Icons.star),
  Text('Rating'),
])
```

**New Syntax (2.0):**
```dart
// Option A: Using explicit named constructor (Recommended)
Column.children([
  Text('Item 1'),
  Text('Item 2'),
])

// Option B: Using explicit parameter
Row(children: [
  Icon(Icons.star),
  Text('Rating'),
])
```
*Note: This change corrects several underlying parsing and positional parameter issues, allowing us to align exactly with Dart's modern linting requirements natively.*

---

## Migration Notes

Please review the **Breaking Changes** outlined above to update your core layout widgets. Other than the syntax shift on `Row`, `Column`, and `Stack`, all newly added utilities and extensions are entirely non-breaking and additive!

---

## **1.0.9 — Container Enhancement Release**

> This release introduces a **comprehensive extension system** for the `Container` widget, bringing it to feature parity with modern declarative UI frameworks and expanding Declar UI's modifier capabilities.

---

### Highlights

* **Dramatically expanded Container modifier API**
* **Advanced decoration and styling primitives**
* **Gradient and image background support**
* **Transform and animation utilities**
* **Enhanced gesture and interaction modifiers**

---

## New Features

### **Advanced Decoration System**

* **`.decoration(BoxDecoration)`** — Apply custom BoxDecoration with full control
* **`.foregroundDecoration(BoxDecoration)`** — Overlay decorations on top of content
* **`.shape(BoxShape)`** — Set container shape (rectangle/circle)
* **`.circle()`** — Quick circular shape shorthand
* **`.square(double)`** — Equal width and height for perfect squares

**Example:**
```dart
Container(Icon(Icons.star))
  .circle()
  .size(width: 60, height: 60)
  .backgroundColor(Colors.blue);
```

---

### **Shadow & Visual Effects**

* **`.shadow()`** — Single shadow with customizable blur, offset, spread, and color
* **`.shadows(List<BoxShadow>)`** — Multiple layered shadows for depth effects

**Example:**
```dart
Container(Text('Elevated Card'))
  .contentPadding(all: 16)
  .radius(all: 12)
  .shadow(
    color: Colors.black26,
    blurRadius: 8,
    offset: Offset(0, 4),
  );
```

---

### **Gradient Backgrounds**

Complete gradient support with three gradient types:

* **`.linearGradient()`** — Linear gradients with customizable direction
* **`.radialGradient()`** — Radial gradients from center point
* **`.sweepGradient()`** — Sweep/conical gradients for circular effects

**Example:**
```dart
Container(Text('Gradient Background'))
  .linearGradient(
    colors: [Colors.purple, Colors.blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  )
  .radius(all: 16);
```

---

### **Image Backgrounds**

* **`.backgroundImage()`** — Set background images with fit, alignment, and color filters

**Example:**
```dart
Container(Text('Overlay Text'))
  .backgroundImage(
    image: NetworkImage('https://example.com/bg.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
      Colors.black45,
      BlendMode.darken,
    ),
  )
  .size(width: 300, height: 200);
```

---

### **Enhanced Border System**

* **`.borderSides()`** — Individual border configuration per side (top, bottom, left, right)

**Example:**
```dart
Container(Text('Custom Borders'))
  .borderSides(
    top: BorderSide(color: Colors.red, width: 3),
    bottom: BorderSide(color: Colors.blue, width: 3),
  )
  .contentPadding(all: 12);
```

---

### **Transform & Animation Utilities**

Powerful transformation modifiers for dynamic UI:

* **`.rotate(double)`** — Rotate by angle in radians
* **`.scale(double)`** — Scale uniformly
* **`.translate()`** — Translate (move) in x, y, z directions
* **`.transform(Matrix4)`** — Apply custom transformation matrix
* **`.transformAlignment(AlignmentGeometry)`** — Set transform pivot point

**Example:**
```dart
Container(Icon(Icons.arrow_forward))
  .rotate(0.785) // 45 degrees
  .transformAlignment(Alignment.center)
  .contentPadding(all: 8);
```

---

### **Clipping & Opacity**

* **`.clip(Clip)`** — Control clipping behavior (hardEdge, antiAlias, etc.)
* **`.opacity(double)`** — Wrap in Opacity widget for fade effects

**Example:**
```dart
Container(Image.network('...'))
  .radius(all: 16)
  .clip(Clip.hardEdge)
  .opacity(0.8);
```

---

### **Layout & Interaction Utilities**

* **`.expand({int flex})`** — Wrap in Expanded widget for flexible layouts
* **`.aspectRatio(double)`** — Maintain aspect ratio constraint
* **`.onTap(VoidCallback)`** — Quick GestureDetector wrapper
* **`.inkWell()`** — Material ripple effects with tap/long-press support

**Example:**
```dart
Container(Text('Tap Me'))
  .contentPadding(all: 16)
  .backgroundColor(Colors.blue)
  .radius(all: 8)
  .inkWell(
    onTap: () => print('Tapped!'),
    splashColor: Colors.white24,
  );
```

---

## Improvements

* **Complete modifier parity** with Flutter's Container widget
* **Chainable API** maintains immutability and composability
* **Comprehensive documentation** with inline examples
* **Type-safe** parameter validation throughout
* **Performance optimized** for production use

---

## API Consistency

All new modifiers follow Declar UI's established patterns:

* Immutable widget modification
* Fluent chaining syntax
* SwiftUI-inspired naming conventions
* Null-safe parameter handling
* Proper BoxDecoration merging for complex compositions

---

## Usage Examples

### Card with Multiple Effects
```dart
Container(
  Column([
    Text('Premium Feature').fontSize(18).bold(),
    Space(height: 8),
    Text('Unlock advanced capabilities'),
  ]),
)
  .contentPadding(all: 20)
  .linearGradient(
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  )
  .radius(all: 16)
  .shadows([
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0xFF667eea).withOpacity(0.3),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ])
  .inkWell(onTap: () => print('Upgrade!'));
```

### Circular Avatar with Border
```dart
Container(Image.network('https://example.com/avatar.jpg'))
  .circle()
  .square(80)
  .border(color: Colors.white, width: 3)
  .shadow(
    color: Colors.black26,
    blurRadius: 8,
    offset: Offset(0, 2),
  )
  .clip(Clip.antiAlias);
```

### Animated Transform Card
```dart
Container(Icon(Icons.favorite, size: 32))
  .contentPadding(all: 16)
  .backgroundColor(Colors.red)
  .circle()
  .scale(isLiked ? 1.2 : 1.0)
  .transformAlignment(Alignment.center)
  .onTap(() => setState(() => isLiked = !isLiked));
```

---

##  Migration Notes

All new features are **additive** — no breaking changes to existing Container API. Existing code continues to work without modification.

New modifiers seamlessly integrate with existing ones:
```dart
// Old style still works
Container(Text('Hello'))
  .backgroundColor(Colors.blue)
  .radius(all: 8);

// Can now be enhanced with new features
Container(Text('Hello'))
  .linearGradient(colors: [Colors.blue, Colors.purple])
  .radius(all: 8)
  .shadow(blurRadius: 4);
```

---

## Complete Feature Set

The Container widget now supports **50+ chainable modifiers** covering:

✅ Size & constraints (width, height, size, square, constrain)  
✅ Padding & margin (contentPadding, contentMargin)  
✅ Colors & gradients (backgroundColor, linearGradient, radialGradient, sweepGradient)  
✅ Borders & shapes (border, borderSides, radius, circle, shape)  
✅ Shadows & effects (shadow, shadows)  
✅ Images & overlays (backgroundImage, foregroundDecoration)  
✅ Transforms (rotate, scale, translate, transform, transformAlignment)  
✅ Clipping & opacity (clip, opacity)  
✅ Alignment (center, topLeft, bottomRight, etc.)  
✅ Layout utilities (expand, aspectRatio)  
✅ Gestures (onTap, inkWell)  


## **1.0.8 — Major Stable Release**

> This release marks a **major milestone** for Declar UI.
> The framework has been **validated in real-world production apps** and introduces a refined, stable, and extensible foundation for declarative Flutter UI development.

---

### Highlights

* **Production-tested API surface**
* **Stabilized fluent modifier system**
* **Expanded sliver & scroll architecture**
* **Advanced spacing & layout primitives**
* **Design-system-ready color and spacing utilities**

This release contains **breaking changes** and is not backward-compatible with `1.x`.

---

##  New Features

### **Declarative `CustomScrollView`**

* SwiftUI-style immutable wrapper around Flutter’s `CustomScrollView`
* Full parity with native API
* Fluent modifiers:

  * Scroll direction, physics, controller, shrinkWrap
  * Keyboard dismiss behavior
  * Padding & SafeArea support
* Designed for expressive **sliver-first layouts**

---

### **Unified `Sliver` API**

* Declarative wrapper supporting:

  * `SliverList`, `SliverGrid`
  * `SliverFixedExtentList`, `SliverPrototypeExtentList`
  * `SliverFillRemaining`, `SliverFillViewport`
  * `SliverToBoxAdapter`
* Chainable modifiers for:

  * Padding & layout control
  * Grid configuration
  * Performance tuning
  * Child transformation
* Seamless integration with `CustomScrollView`

---

### **Advanced Spacing System**

* Introduced **render-object–based spacing primitives**
* New `Spacing` enum with semantic values
* Widgets:

  * `Space`
  * `MaxSpace`
  * `SliverSpace`
  * `SliverFlexibleSpace`
* Automatically adapts to:

  * Flex direction (Row / Column)
  * Scroll direction (vertical / horizontal)
* Optimized for performance and composability

---

### **Powerful `Group` Layout Container**

* Unified abstraction over:

  * Column
  * Row
  * Stack
  * Wrap
* Container-level modifiers:

  * Padding, decoration, spacing
  * Overlays & backgrounds
  * Gestures & animations
* Enables compact expression of complex layouts

---

### **Color Extension System**

* Comprehensive UI-focused `Color` extensions:

  * Brightness & saturation control
  * Opacity helpers
  * Color harmony utilities
  * WCAG contrast checks
  * Material color generation
* Includes factory helpers:

  * Hex, RGB, HSL, HSV creation

---

## Improvements

* Internal rendering architecture refined for performance and consistency
* API naming aligned across widgets and extensions
* Extensive documentation added across public APIs
* Reduced boilerplate and improved developer ergonomics

---

##  Breaking Changes

* Public API reorganization to support long-term stability
* Introduction of sliver-first primitives may require layout migration
* Some legacy utilities and experimental APIs removed or renamed

---

## Stability & Production Readiness

* APIs validated in **real-world Flutter applications**
* Designed for **scalability, performance, and maintainability**
* Safe for use in production environments

---


## **0.0.6**
  * **Minor hotfix to Group Widget**

## **0.0.5**

###  New Features

* **`Group` Widget (`group.dart`)**
  Introduced a powerful layout utility widget that enables grouping multiple widgets under a unified configuration.
  Supports:

  * **Vertical, horizontal, and stacked layouts**
  * **Shared modifiers** across all children (padding, decoration, frame sizing, alignment, spacing)
  * **Container-like wrapping** with decoration, background, overlay, tap gestures, and animation support
  * **Per-layout alignment**

    * `makeVertical(main:, cross:)`
    * `makeHorizontal(main:, cross:)`
    * `makeStack(alignment:)`
  * **Unified fluent-style modifier API**

    * `.padding()`, `.backgroundColor()`, `.cornerRadius()`, `.frame()`,
      `.spacing()`, `.overlayView()`, `.backgroundView()`,
      `.onTapGesture()`, `.animation()`, and more.

This widget significantly enhances Declar UI’s composability by allowing complex layouts to be expressed in a compact and expressive manner.

###  Improvements

* Internal utility cleanup and alignment updates for consistency with other Declar UI widgets.
* Documentation comments added to `group.dart` for clear API usage.


## 0.0.4

### Updates
### New Features
- **`Screen` Utility (`screen.dart`):** Introduced a comprehensive utility for responsive UI development, providing easy access to device dimensions, orientation, platform, safe area insets, keyboard visibility, and accessibility settings via `BuildContext` extensions.
- **`Constants` Utility (`constants.dart`):** Added a set of predefined, scalable design constants for consistent spacing (`DSize`) and corner radii (`DRadius`), promoting visual harmony across UI components.

### Improvements
- **README Update:** The `README.md` has been significantly updated to include detailed documentation and examples for the new `Screen` and `Constants` utilities, along with general enhancements for clarity and professionalism.
- **Code Structure:** Organized new utilities into dedicated files (`screen.dart`, `constants.dart`) within the `lib/widgets` directory for better modularity.

---
## 0.0.3

### Widget Declar Retracted

---

## 0.0.2

### Material App update
- `MaterialApp` now supports `routerConfig` for declarative routing.
- Added `themeMode` and `darkTheme` properties to `MaterialApp` for better theme management.
---
## 0.0.1

### Initial Stable Release — Declar UI

The first public release of **Declar UI**, a declarative and composable Flutter UI framework developed by **UpDown Interactive**.

### Highlights
- Introduced declarative Flutter widget wrappers:
  - `Text`, `Container`, `Row`, `Column`, `SizedBox`, `Icon`, `Image`, `MaterialApp`, and `Stack`
- Added **extension modifiers** for all widgets:
  - `.padding()`, `.backgroundColor()`, `.radius()`, `.border()`, `.center()`, `.align()`, `.size()`, `.opacity()`, `.visible()`, `.onTap()`, `.rotate()`, and more
- Implemented **SwiftUI-like fluent syntax** for expressive, chainable widget configuration
- Added comprehensive **unit and widget test coverage**
- Included developer-friendly **documentation comments** and structured code organization
- Fully compatible with **Flutter 3.16+**

### Summary
This release establishes the foundation of Declar UI — bringing clean, functional, and declarative design principles to Flutter development.

