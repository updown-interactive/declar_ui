// ------------------------------------------------------------ //
//  widget+extension.dart
//
//  Created by Siva Sankar on 2025-11-11.
// ------------------------------------------------------------ //

import 'dart:ui' as ui;
import 'package:declar_ui/declar_ui.dart';

extension DeclarativeWidgetExtensions on Widget {
  // MARK: - Padding

  /// Add padding around this widget
  Widget padding({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: all + left + horizontal,
        right: all + right + horizontal,
        top: all + top + vertical,
        bottom: all + bottom + vertical,
      ),
      child: this,
    );
  }

  // MARK: - Background & Foreground

  /// Add background color
  Widget background(Color color) {
    return Container(color: color, child: this);
  }

  /// Add gradient background
  Widget gradientBackground(Gradient gradient) {
    return Container(
        decoration: BoxDecoration(gradient: gradient), child: this);
  }

  /// Add foreground color (for text/icons)
  Widget foregroundColor(Color color) {
    return DefaultTextStyle.merge(
      style: TextStyle(color: color),
      child: IconTheme.merge(
        data: IconThemeData(color: color),
        child: this,
      ),
    );
  }

  // MARK: - Shape & Border

  /// Add corner radius (requires wrapping in Container)
  Widget cornerRadius(double radius) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }

  /// Add custom border radius
  Widget customCornerRadius({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: this,
    );
  }

  /// Add border
  Widget border({
    Color color = Colors.black,
    double width = 1.0,
    double radius = 0,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
        borderRadius: radius > 0 ? BorderRadius.circular(radius) : null,
      ),
      child: this,
    );
  }

  /// Add circular clip
  Widget clipCircle() {
    return ClipOval(child: this);
  }

  // MARK: - Shadow & Overlay

  /// Add shadow
  Widget shadow({
    Color color = Colors.black26,
    double blurRadius = 8.0,
    double spreadRadius = 0,
    Offset offset = const Offset(0, 2),
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: this,
    );
  }
  // MARK: - Size & Layout

  /// Set fixed frame size
  Widget frame({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Expand to fill available space
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Flexible sizing
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  /// Center the widget
  Widget center() {
    return Center(child: this);
  }

  /// Align the widget
  Widget align(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  /// Add aspect ratio constraint
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Fill max width
  Widget fillMaxWidth() {
    return SizedBox(width: double.infinity, child: this);
  }

  /// Fill max height
  Widget fillMaxHeight() {
    return SizedBox(height: double.infinity, child: this);
  }

  // MARK: - Gestures & Interaction

  /// Add tap gesture
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Add long press gesture
  Widget onLongPress(VoidCallback onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Add double tap gesture
  Widget onDoubleTap(VoidCallback onDoubleTap) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  // MARK: - Opacity & Visibility

  /// Set opacity
  Widget opacity(double opacity) {
    return Opacity(opacity: opacity.clamp(0.0, 1.0), child: this);
  }

  /// Conditionally show/hide
  Widget visible(bool isVisible) {
    return Visibility(visible: isVisible, child: this);
  }

  /// Ignore pointer events
  Widget ignorePointer({bool ignoring = true}) {
    return IgnorePointer(ignoring: ignoring, child: this);
  }

  // MARK: - Transformation

  /// Rotate the widget
  Widget rotate(double angle) {
    return Transform.rotate(angle: angle, child: this);
  }

  /// Scale the widget
  Widget scale(double scale) {
    return Transform.scale(scale: scale, child: this);
  }

  /// Translate the widget
  Widget offset(Offset offset) {
    return Transform.translate(offset: offset, child: this);
  }

  // MARK: - Scrolling

  /// Make scrollable
  Widget scrollable({Axis axis = Axis.vertical, ScrollPhysics? physics}) {
    return SingleChildScrollView(
      scrollDirection: axis,
      physics: physics,
      child: this,
    );
  }

  // MARK: - Card & Material

  /// Wrap in Card
  Widget card({
    double elevation = 1.0,
    Color? color,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
  }) {
    return Card(
      elevation: elevation,
      color: color,
      shape: shape,
      margin: margin,
      child: this,
    );
  }

  /// Wrap in Material
  Widget material({
    double elevation = 0,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return Material(
      elevation: elevation,
      color: color,
      borderRadius: borderRadius,
      child: this,
    );
  }

  // MARK: - Hero & Animation

  /// Add Hero animation
  Widget hero(String tag) {
    return Hero(tag: tag, child: this);
  }

  /// Add animated container properties
  Widget animated(Duration duration, {Curve curve = Curves.easeInOut}) {
    return AnimatedContainer(duration: duration, curve: curve, child: this);
  }

  // MARK: - SafeArea

  /// Add safe area padding
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  // MARK: - Conditional Modifiers

  /// Conditionally apply a modifier
  Widget when(bool condition, Widget Function(Widget) builder) {
    return condition ? builder(this) : this;
  }

  /// Apply decoration
  Widget decorated({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        shape: shape,
      ),
      child: this,
    );
  }

  // MARK: - Production Level Effects & Utilities

  /// Apply a blur effect (Glassmorphism) over the widget
  Widget blur(
      {double sigmaX = 5.0, double sigmaY = 5.0, BorderRadius? borderRadius}) {
    Widget blurry = BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: this,
    );

    return borderRadius != null
        ? ClipRRect(borderRadius: borderRadius, child: blurry)
        : ClipRect(child: blurry);
  }

  /// Add a tooltip
  Widget tooltip(
    String message, {
    Duration? waitDuration,
    Decoration? decoration,
    TextStyle? textStyle,
  }) {
    return Tooltip(
      message: message,
      waitDuration: waitDuration,
      decoration: decoration,
      textStyle: textStyle,
      child: this,
    );
  }

  /// Unfocus keyboard on tap (useful for tap outside textfield)
  Widget unfocusOnTap(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: this,
    );
  }

  /// Convert into a Sliver (to be used inside CustomScrollView/Slivers)
  Widget asSliver() {
    return SliverToBoxAdapter(child: this);
  }
}
