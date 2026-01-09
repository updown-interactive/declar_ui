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

