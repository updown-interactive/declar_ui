# Declar UI

**Declar UI** is a lightweight declarative UI framework for Flutter, developed by **UpDown Interactive**.
It introduces a **fluent, composable, and expressive syntax** for Flutter widget construction — inspired by **SwiftUI** and **Jetpack Compose** — while maintaining full compatibility with Flutter’s existing widget ecosystem.

Built and maintained by **Siva Sankar**.

---

## Overview

Declar UI provides an elegant declarative interface for building Flutter UIs.
It wraps core Flutter widgets such as `Text`, `Container`, `Row`, `Column`, `SizedBox`, and more into **chainable, immutable components** with modifier-style extensions.

This allows you to express layout, styling, and interaction in a **clear, chainable, and functional** way.

---

## Installation

```bash
flutter pub add declar_ui
```

Then import it:

```dart
import 'package:declar_ui/declar_ui.dart';
```

---

## Comparison

### Traditional Flutter

```dart
Container(
  padding: const EdgeInsets.all(12),
  color: Colors.blue,
  alignment: Alignment.center,
  child: Text(
    'Hello World',
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
```

### With Declar UI

```dart
Container(
  child: Text('Hello World')
      .color(Colors.white)
      .size(20)
      .weight(FontWeight.bold),
)
  .backgroundColor(Colors.blue)
  .contentPadding(all: 12)
  .center()
  .radius(all: 8);
```

---

## Features

✅ **Declarative API** — Build UI with composable and readable chains.
✅ **Fluent Modifiers** — Configure layout, style, and alignment with expressive methods.
✅ **Immutable Widgets** — Every modifier returns a new instance for safety and composability.
✅ **Full Flutter Compatibility** — Works seamlessly inside existing Flutter projects.
✅ **Tested and Reliable** — Core widgets and modifiers covered by widget tests.
✅ **Utility Extensions** — Includes responsive screen helpers and design constants.

---

## Widgets

Declar UI redefines core Flutter widgets with expressive, chainable APIs.

### Text

```dart
Text('Declar UI')
  .color(Colors.indigo)
  .size(22)
  .weight(FontWeight.w600)
  .italic()
  .underline()
  .align(TextAlign.center);
```

### Container

```dart
Container(child: Text('Welcome'))
  .backgroundColor(Colors.teal)
  .contentPadding(all: 16)
  .radius(all: 12)
  .border(color: Colors.black12, width: 1.5)
  .center();
```

### Row and Column

```dart
Row([
  Icon(Icons.home).color(Colors.blue),
  Text('Home').weight(FontWeight.bold)
])
  .spacing(10)
  .align(main: MainAxisAlignment.center);

Column([
  Text('Item 1'),
  Text('Item 2'),
])
  .spacing(8)
  .align(main: MainAxisAlignment.center);
```

### SizedBox

```dart
SizedBox(Text('Content')).size(width: 120, height: 80);
SizedBox(null).expanded(expandWidth: true, expandHeight: true);
```

### Icon

```dart
Icon(Icons.favorite)
  .color(Colors.red)
  .size(30)
  .shadow([
    Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.black26)
  ])
  .align(Alignment.centerRight);
```

### Image

```dart
Image.network('https://picsum.photos/400')
  .fit(BoxFit.cover)
  .radius(all: 10)
  .color(Colors.black26, blend: BlendMode.darken)
  .size(width: 200, height: 150);
```

### Stack

```dart
Stack([
  Image.asset('assets/bg.jpg'),
  Text('Overlay').color(Colors.white).center(),
]).alignment(Alignment.center).fit(StackFit.expand);
```

---

### Scaffold

```dart
Scaffold(
  body:  Column([
      Text('Hello from Declar UI')
        .size(18)
        .color(Colors.black87)
        .center(),
    ]),
)
  .appBar(AppBar(title: Text('Declar UI')))
  .floatingActionButton(
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
  );
```

> 🧩 The Declar version of `Scaffold` supports chainable methods for `appBar`, `body`, `floatingActionButton`, and more — enabling fluent page structure composition.

---

### MaterialApp (Declarative)

```dart
MaterialApp(
  home: HomePage()
)
  .title('Declar UI Demo')
  .theme(ThemeData(primarySwatch: Colors.indigo))
  .debugBanner(false);
```

---

## Declar Widget

`Declar` is a minimal, declarative `StatefulWidget` that provides inline lifecycle hooks similar to SwiftUI’s `onAppear` and `onDisappear`.

```dart
Declar(
  init: () => print('Initialized'),
  dispose: () => print('Disposed'),
  builder: (context) => Text('Declar UI is active!'),
);
```

**Features:**

* Inline lifecycle control (`init`, `dispose`, `didUpdate`)
* Stateless builder syntax
* Perfect for lightweight, declarative logic blocks

---

## When Widget

`When` is a declarative, composable conditional widget — similar to SwiftUI’s `if` view builder — that renders widgets based on a boolean condition.

### Example

```dart
When(condition: isLoggedIn)
  .then(
    Container(child: Text('Welcome back!'))
      .backgroundColor(Colors.green)
      .contentPadding(all: 12)
      .radius(all: 8),
  )
  .otherwise(
    Container(child: Text('Please log in'))
      .backgroundColor(Colors.red)
      .contentPadding(all: 12)
      .radius(all: 8),
  );
```

---

## Screen Utilities (`screen.dart`)

The **Screen API** provides responsive utilities, device info, and accessibility helpers directly on the `BuildContext`.

```dart
final height = context.maxHeight;
final isDark = context.isDarkMode;
final safePadding = context.safeAreaPadding.top;
final isTablet = context.isTabletSize;
```

### Highlights

| Category       | Example                                                                      |
| -------------- | ---------------------------------------------------------------------------- |
| Dimensions     | `context.maxWidth`, `context.maxHeight`, `context.screenSize`                |
| Orientation    | `context.isLandscape`, `context.isPortrait`                                  |
| Brightness     | `context.isDarkMode`, `context.isLightMode`                                  |
| Keyboard       | `context.isKeyboardVisible`, `context.keyboardHeight`                        |
| Safe Area      | `context.safeAreaPadding`, `context.bottomSafeAreaHeight`                    |
| Platform       | `context.isMobile`, `context.isTablet`, `context.isDesktop`, `context.isWeb` |
| Accessibility  | `context.isBoldTextEnabled`, `context.isHighContrastEnabled`                 |
| Responsiveness | `context.isSm`, `context.isMd`, `context.isLg`, `context.isXl`               |

### Example

```dart
if (context.isMobile) {
  return Column([
    Text('Mobile Layout'),
  ]);
} else {
  return Row([
    Text('Tablet/Desktop Layout'),
  ]);
}
```

---

## Design Constants (`constants.dart`)

Declar UI defines **consistent, scalable design constants** for spacing and corner radii.

### Spacing — `DSize`

```dart
padding: EdgeInsets.all(DSize.md); // 16.0
margin: EdgeInsets.symmetric(horizontal: DSize.lg); // 24.0
```

| Name         | Value | Description        |
| ------------ | ----- | ------------------ |
| `DSize.xs`   | 4.0   | Extra small        |
| `DSize.sm`   | 8.0   | Small              |
| `DSize.md`   | 16.0  | Medium             |
| `DSize.lg`   | 24.0  | Large              |
| `DSize.xl`   | 32.0  | Extra large        |
| `DSize.xxl`  | 40.0  | Double extra large |
| `DSize.xxxl` | 48.0  | Triple extra large |

### Radius — `DRadius`

```dart
borderRadius: DRadius.mdRadius, // 12.0
shape: RoundedRectangleBorder(borderRadius: DRadius.cardRadius),
```

| Name               | Value | Description   |
| ------------------ | ----- | ------------- |
| `DRadius.xs`       | 4.0   | Extra small   |
| `DRadius.sm`       | 8.0   | Small         |
| `DRadius.md`       | 12.0  | Medium        |
| `DRadius.lg`       | 16.0  | Large         |
| `DRadius.xl`       | 20.0  | Extra large   |
| `DRadius.circular` | 999.0 | Full circular |

> These constants help maintain visual consistency across UI components.

---

## Widget Extensions

```dart
Text('Hello')
  .padding(all: 16)
  .background(Colors.blueGrey)
  .cornerRadius(8)
  .opacity(0.9)
  .center()
  .onTap(() => print('Tapped'))
  .when(true, (widget) => widget.background(Colors.green))
  .visible(true);
```

---

## Project Structure

```
lib/
 ├─ declar_ui.dart
 ├─ widgets/
 │   ├─ text.dart
 │   ├─ container_extension.dart
 │   ├─ row.dart
 │   ├─ column.dart
 │   ├─ sizedbox.dart
 │   ├─ icon.dart
 │   ├─ scaffold.dart
 │   ├─ declar.dart
 │   ├─ when.dart
 │   ├─ screen.dart      ← NEW
 │   └─ constants.dart   ← NEW
 └─ extensions/
     └─ widget_extensions.dart
```

---

## About

**Declar UI** is developed and maintained by **UpDown Interactive**,
founded by **Siva Sankar**, focused on building expressive, modern, and declarative developer tools for Flutter.

---

### License

This project is licensed under the **MIT License**.
See the [LICENSE](LICENSE) file for details.

