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

