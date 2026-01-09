// ------------------------------------------------------------
//  text_field.dart
//
//  Created by Siva Sankar on 2025-01-09.
// ------------------------------------------------------------

import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart' as services;

/// A declarative wrapper around Flutter's [TextField] widget that
/// supports **fluent-style extensions** for easy text field configuration.
///
/// Example:
/// ```dart
/// TextField()
///   .placeholder('Enter your name')
///   .textColor(material.Colors.black)
///   .fontSize(16)
///   .maxLines(1)
///   .onChanged((value) => print(value));
/// ```
class TextField extends material.StatelessWidget {
  final material.TextEditingController? _controller;
  final material.FocusNode? _focusNode;
  final material.InputDecoration? _decoration;
  final material.TextInputType? _keyboardType;
  final material.TextInputAction? _textInputAction;
  final material.TextCapitalization _textCapitalization;
  final material.TextStyle? _style;
  final material.StrutStyle? _strutStyle;
  final material.TextAlign _textAlign;
  final material.TextAlignVertical? _textAlignVertical;
  final material.TextDirection? _textDirection;
  final bool _readOnly;
  final bool? _showCursor;
  final bool _autofocus;
  final String _obscuringCharacter;
  final bool _obscureText;
  final bool _autocorrect;
  final material.SmartDashesType? _smartDashesType;
  final material.SmartQuotesType? _smartQuotesType;
  final bool _enableSuggestions;
  final int? _maxLines;
  final int? _minLines;
  final bool _expands;
  final int? _maxLength;
  final services.MaxLengthEnforcement? _maxLengthEnforcement;
  final void Function(String)? _onChanged;
  final void Function()? _onEditingComplete;
  final void Function(String)? _onSubmitted;
  final void Function(String, Map<String, dynamic>)? _onAppPrivateCommand;
  final List<services.TextInputFormatter>? _inputFormatters;
  final bool? _enabled;
  final double _cursorWidth;
  final double? _cursorHeight;
  final material.Radius? _cursorRadius;
  final material.Color? _cursorColor;
  final material.Brightness? _keyboardAppearance;
  final material.EdgeInsets _scrollPadding;
  final bool? _enableInteractiveSelection;
  final material.TextSelectionControls? _selectionControls;
  final material.GestureTapCallback? _onTap;
  final bool _enableIMEPersonalizedLearning;
  final material.MouseCursor? _mouseCursor;
  final material.ScrollPhysics? _scrollPhysics;
  final material.ScrollController? _scrollController;
  final String? _restorationId;
  final bool _scribbleEnabled;
  final bool _canRequestFocus;
  final material.Clip _clipBehavior;

  /// Creates a declarative [TextField] widget.
  const TextField({
    super.key,
    material.TextEditingController? controller,
    material.FocusNode? focusNode,
    material.InputDecoration? decoration,
    material.TextInputType? keyboardType,
    material.TextInputAction? textInputAction,
    material.TextCapitalization textCapitalization =
        material.TextCapitalization.none,
    material.TextStyle? style,
    material.StrutStyle? strutStyle,
    material.TextAlign textAlign = material.TextAlign.start,
    material.TextAlignVertical? textAlignVertical,
    material.TextDirection? textDirection,
    bool readOnly = false,
    bool? showCursor,
    bool autofocus = false,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    material.SmartDashesType? smartDashesType,
    material.SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    services.MaxLengthEnforcement? maxLengthEnforcement,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    void Function(String)? onSubmitted,
    void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
    List<services.TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    material.Radius? cursorRadius,
    material.Color? cursorColor,
    material.Brightness? keyboardAppearance,
    material.EdgeInsets scrollPadding = const material.EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    material.TextSelectionControls? selectionControls,
    material.GestureTapCallback? onTap,
    bool enableIMEPersonalizedLearning = true,
    material.MouseCursor? mouseCursor,
    material.ScrollPhysics? scrollPhysics,
    material.ScrollController? scrollController,
    String? restorationId,
    bool scribbleEnabled = true,
    bool canRequestFocus = true,
    material.Clip clipBehavior = material.Clip.hardEdge,
  })  : _controller = controller,
        _focusNode = focusNode,
        _decoration = decoration,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _textCapitalization = textCapitalization,
        _style = style,
        _strutStyle = strutStyle,
        _textAlign = textAlign,
        _textAlignVertical = textAlignVertical,
        _textDirection = textDirection,
        _readOnly = readOnly,
        _showCursor = showCursor,
        _autofocus = autofocus,
        _obscuringCharacter = obscuringCharacter,
        _obscureText = obscureText,
        _autocorrect = autocorrect,
        _smartDashesType = smartDashesType,
        _smartQuotesType = smartQuotesType,
        _enableSuggestions = enableSuggestions,
        _maxLines = maxLines,
        _minLines = minLines,
        _expands = expands,
        _maxLength = maxLength,
        _maxLengthEnforcement = maxLengthEnforcement,
        _onChanged = onChanged,
        _onEditingComplete = onEditingComplete,
        _onSubmitted = onSubmitted,
        _onAppPrivateCommand = onAppPrivateCommand,
        _inputFormatters = inputFormatters,
        _enabled = enabled,
        _cursorWidth = cursorWidth,
        _cursorHeight = cursorHeight,
        _cursorRadius = cursorRadius,
        _cursorColor = cursorColor,
        _keyboardAppearance = keyboardAppearance,
        _scrollPadding = scrollPadding,
        _enableInteractiveSelection = enableInteractiveSelection,
        _selectionControls = selectionControls,
        _onTap = onTap,
        _enableIMEPersonalizedLearning = enableIMEPersonalizedLearning,
        _mouseCursor = mouseCursor,
        _scrollPhysics = scrollPhysics,
        _scrollController = scrollController,
        _restorationId = restorationId,
        _scribbleEnabled = scribbleEnabled,
        _canRequestFocus = canRequestFocus,
        _clipBehavior = clipBehavior;

  /// Immutable copy helper for chaining.
  TextField _copyWith({
    material.TextEditingController? controller,
    material.FocusNode? focusNode,
    material.InputDecoration? decoration,
    material.TextInputType? keyboardType,
    material.TextInputAction? textInputAction,
    material.TextCapitalization? textCapitalization,
    material.TextStyle? style,
    material.StrutStyle? strutStyle,
    material.TextAlign? textAlign,
    material.TextAlignVertical? textAlignVertical,
    material.TextDirection? textDirection,
    bool? readOnly,
    bool? showCursor,
    bool? autofocus,
    String? obscuringCharacter,
    bool? obscureText,
    bool? autocorrect,
    material.SmartDashesType? smartDashesType,
    material.SmartQuotesType? smartQuotesType,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    int? maxLength,
    services.MaxLengthEnforcement? maxLengthEnforcement,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    void Function(String)? onSubmitted,
    void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
    List<services.TextInputFormatter>? inputFormatters,
    bool? enabled,
    double? cursorWidth,
    double? cursorHeight,
    material.Radius? cursorRadius,
    material.Color? cursorColor,
    material.Brightness? keyboardAppearance,
    material.EdgeInsets? scrollPadding,
    bool? enableInteractiveSelection,
    material.TextSelectionControls? selectionControls,
    material.GestureTapCallback? onTap,
    bool? enableIMEPersonalizedLearning,
    material.MouseCursor? mouseCursor,
    material.ScrollPhysics? scrollPhysics,
    material.ScrollController? scrollController,
    String? restorationId,
    bool? scribbleEnabled,
    bool? canRequestFocus,
    material.Clip? clipBehavior,
    bool clearController = false,
    bool clearFocusNode = false,
  }) {
    return TextField(
      key: key,
      controller: clearController ? null : (controller ?? _controller),
      focusNode: clearFocusNode ? null : (focusNode ?? _focusNode),
      decoration: decoration ?? _decoration,
      keyboardType: keyboardType ?? _keyboardType,
      textInputAction: textInputAction ?? _textInputAction,
      textCapitalization: textCapitalization ?? _textCapitalization,
      style: style ?? _style,
      strutStyle: strutStyle ?? _strutStyle,
      textAlign: textAlign ?? _textAlign,
      textAlignVertical: textAlignVertical ?? _textAlignVertical,
      textDirection: textDirection ?? _textDirection,
      readOnly: readOnly ?? _readOnly,
      showCursor: showCursor ?? _showCursor,
      autofocus: autofocus ?? _autofocus,
      obscuringCharacter: obscuringCharacter ?? _obscuringCharacter,
      obscureText: obscureText ?? _obscureText,
      autocorrect: autocorrect ?? _autocorrect,
      smartDashesType: smartDashesType ?? _smartDashesType,
      smartQuotesType: smartQuotesType ?? _smartQuotesType,
      enableSuggestions: enableSuggestions ?? _enableSuggestions,
      maxLines: maxLines ?? _maxLines,
      minLines: minLines ?? _minLines,
      expands: expands ?? _expands,
      maxLength: maxLength ?? _maxLength,
      maxLengthEnforcement: maxLengthEnforcement ?? _maxLengthEnforcement,
      onChanged: onChanged ?? _onChanged,
      onEditingComplete: onEditingComplete ?? _onEditingComplete,
      onSubmitted: onSubmitted ?? _onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand ?? _onAppPrivateCommand,
      inputFormatters: inputFormatters ?? _inputFormatters,
      enabled: enabled ?? _enabled,
      cursorWidth: cursorWidth ?? _cursorWidth,
      cursorHeight: cursorHeight ?? _cursorHeight,
      cursorRadius: cursorRadius ?? _cursorRadius,
      cursorColor: cursorColor ?? _cursorColor,
      keyboardAppearance: keyboardAppearance ?? _keyboardAppearance,
      scrollPadding: scrollPadding ?? _scrollPadding,
      enableInteractiveSelection:
          enableInteractiveSelection ?? _enableInteractiveSelection,
      selectionControls: selectionControls ?? _selectionControls,
      onTap: onTap ?? _onTap,
      enableIMEPersonalizedLearning:
          enableIMEPersonalizedLearning ?? _enableIMEPersonalizedLearning,
      mouseCursor: mouseCursor ?? _mouseCursor,
      scrollPhysics: scrollPhysics ?? _scrollPhysics,
      scrollController: scrollController ?? _scrollController,
      restorationId: restorationId ?? _restorationId,
      scribbleEnabled: scribbleEnabled ?? _scribbleEnabled,
      canRequestFocus: canRequestFocus ?? _canRequestFocus,
      clipBehavior: clipBehavior ?? _clipBehavior,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.TextField(
      key: key,
      controller: _controller,
      focusNode: _focusNode,
      decoration: _decoration,
      keyboardType: _keyboardType,
      textInputAction: _textInputAction,
      textCapitalization: _textCapitalization,
      style: _style,
      strutStyle: _strutStyle,
      textAlign: _textAlign,
      textAlignVertical: _textAlignVertical,
      textDirection: _textDirection,
      readOnly: _readOnly,
      showCursor: _showCursor,
      autofocus: _autofocus,
      obscuringCharacter: _obscuringCharacter,
      obscureText: _obscureText,
      autocorrect: _autocorrect,
      smartDashesType: _smartDashesType,
      smartQuotesType: _smartQuotesType,
      enableSuggestions: _enableSuggestions,
      maxLines: _maxLines,
      minLines: _minLines,
      expands: _expands,
      maxLength: _maxLength,
      maxLengthEnforcement: _maxLengthEnforcement,
      onChanged: _onChanged,
      onEditingComplete: _onEditingComplete,
      onSubmitted: _onSubmitted,
      onAppPrivateCommand: _onAppPrivateCommand,
      inputFormatters: _inputFormatters,
      enabled: _enabled,
      cursorWidth: _cursorWidth,
      cursorHeight: _cursorHeight,
      cursorRadius: _cursorRadius,
      cursorColor: _cursorColor,
      keyboardAppearance: _keyboardAppearance,
      scrollPadding: _scrollPadding,
      enableInteractiveSelection: _enableInteractiveSelection,
      selectionControls: _selectionControls,
      onTap: _onTap,
      enableIMEPersonalizedLearning: _enableIMEPersonalizedLearning,
      mouseCursor: _mouseCursor,
      scrollPhysics: _scrollPhysics,
      scrollController: _scrollController,
      restorationId: _restorationId,
      scribbleEnabled: _scribbleEnabled,
      canRequestFocus: _canRequestFocus,
      clipBehavior: _clipBehavior,
    );
  }
}

// MARK: - TextField Modifiers

/// Extension methods that provide expressive, chainable modifiers
/// for the declarative [TextField] widget.
///
/// Each modifier returns a **new [TextField] instance**, enabling an
/// immutable, SwiftUI-style configuration pattern.
///
/// ### Example
/// ```dart
/// TextField()
///   .placeholder('Email')
///   .textColor(Colors.black)
///   .fontSize(16)
///   .keyboardType(TextInputType.emailAddress)
///   .onChanged((value) => print(value));
/// ```
extension TextFieldExtension on TextField {
  // ==================== Controller & Focus ====================

  /// Sets the text editing controller.
  TextField controller(material.TextEditingController controller) =>
      _copyWith(controller: controller);

  /// Sets the focus node.
  TextField focusNode(material.FocusNode focusNode) =>
      _copyWith(focusNode: focusNode);

  /// Removes the controller.
  TextField noController() => _copyWith(clearController: true);

  /// Removes the focus node.
  TextField noFocusNode() => _copyWith(clearFocusNode: true);

  // ==================== Decoration ====================

  /// Sets the input decoration.
  TextField decoration(material.InputDecoration decoration) =>
      _copyWith(decoration: decoration);

  /// Sets a placeholder/hint text.
  TextField placeholder(String text, {material.TextStyle? style}) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(
      decoration: decoration.copyWith(
        hintText: text,
        hintStyle: style,
      ),
    );
  }

  /// Sets a label text.
  TextField label(String text, {material.TextStyle? style}) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(
      decoration: decoration.copyWith(
        labelText: text,
        labelStyle: style,
      ),
    );
  }

  /// Sets helper text.
  TextField helperText(String text, {material.TextStyle? style}) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(
      decoration: decoration.copyWith(
        helperText: text,
        helperStyle: style,
      ),
    );
  }

  /// Sets error text.
  TextField errorText(String? text, {material.TextStyle? style}) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(
      decoration: decoration.copyWith(
        errorText: text,
        errorStyle: style,
      ),
    );
  }

  /// Sets a prefix icon.
  TextField prefixIcon(material.Widget icon) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(decoration: decoration.copyWith(prefixIcon: icon));
  }

  /// Sets a suffix icon.
  TextField suffixIcon(material.Widget icon) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(decoration: decoration.copyWith(suffixIcon: icon));
  }

  /// Sets the input border.
  TextField border(material.InputBorder border) {
    final decoration = _decoration ?? const material.InputDecoration();
    return _copyWith(decoration: decoration.copyWith(border: border));
  }

  /// Removes the border.
  TextField noBorder() {
    final decoration = _decoration ?? const material.InputDecoration();
    return _copyWith(
      decoration: decoration.copyWith(border: material.InputBorder.none),
    );
  }

  /// Sets filled background.
  TextField filled(bool value, {material.Color? fillColor}) {
    final decoration = _decoration ??
        const material.InputDecoration(border: material.OutlineInputBorder());
    return _copyWith(
      decoration: decoration.copyWith(
        filled: value,
        fillColor: fillColor,
      ),
    );
  }

  // ==================== Text Style ====================

  /// Sets the text color.
  TextField textColor(material.Color color) => _copyWith(
        style: (_style ?? const material.TextStyle()).copyWith(color: color),
      );

  /// Sets the font size.
  TextField fontSize(double size) => _copyWith(
        style: (_style ?? const material.TextStyle()).copyWith(fontSize: size),
      );

  /// Sets the font weight.
  TextField fontWeight(material.FontWeight weight) => _copyWith(
        style:
            (_style ?? const material.TextStyle()).copyWith(fontWeight: weight),
      );

  /// Sets the font family.
  TextField fontFamily(String family) => _copyWith(
        style:
            (_style ?? const material.TextStyle()).copyWith(fontFamily: family),
      );

  /// Sets letter spacing.
  TextField letterSpacing(double spacing) => _copyWith(
        style: (_style ?? const material.TextStyle())
            .copyWith(letterSpacing: spacing),
      );

  /// Applies italic styling.
  TextField italic() => _copyWith(
        style: (_style ?? const material.TextStyle())
            .copyWith(fontStyle: material.FontStyle.italic),
      );

  // ==================== Text Alignment ====================

  /// Sets text alignment.
  TextField textAlign(material.TextAlign align) => _copyWith(textAlign: align);

  /// Centers the text.
  TextField centerText() => _copyWith(textAlign: material.TextAlign.center);

  /// Left-aligns the text.
  TextField leftText() => _copyWith(textAlign: material.TextAlign.left);

  /// Right-aligns the text.
  TextField rightText() => _copyWith(textAlign: material.TextAlign.right);

  // ==================== Keyboard Configuration ====================

  /// Sets the keyboard type.
  TextField keyboardType(material.TextInputType type) =>
      _copyWith(keyboardType: type);

  /// Sets keyboard for email input.
  TextField emailKeyboard() =>
      _copyWith(keyboardType: material.TextInputType.emailAddress);

  /// Sets keyboard for number input.
  TextField numberKeyboard() =>
      _copyWith(keyboardType: material.TextInputType.number);

  /// Sets keyboard for phone input.
  TextField phoneKeyboard() =>
      _copyWith(keyboardType: material.TextInputType.phone);

  /// Sets keyboard for URL input.
  TextField urlKeyboard() =>
      _copyWith(keyboardType: material.TextInputType.url);

  /// Sets the text input action.
  TextField textInputAction(material.TextInputAction action) =>
      _copyWith(textInputAction: action);

  /// Sets text capitalization.
  TextField capitalization(material.TextCapitalization cap) =>
      _copyWith(textCapitalization: cap);

  /// Capitalizes words.
  TextField capitalizeWords() =>
      _copyWith(textCapitalization: material.TextCapitalization.words);

  /// Capitalizes sentences.
  TextField capitalizeSentences() =>
      _copyWith(textCapitalization: material.TextCapitalization.sentences);

  /// Capitalizes all characters.
  TextField capitalizeAll() =>
      _copyWith(textCapitalization: material.TextCapitalization.characters);

  // ==================== Behavior ====================

  /// Makes the text field read-only.
  TextField readOnly([bool value = true]) => _copyWith(readOnly: value);

  /// Shows or hides the cursor.
  TextField showCursor(bool value) => _copyWith(showCursor: value);

  /// Sets autofocus.
  TextField autofocus([bool value = true]) => _copyWith(autofocus: value);

  /// Obscures text (for passwords).
  TextField secure([bool value = true]) => _copyWith(obscureText: value);

  /// Sets the obscuring character.
  TextField obscuringCharacter(String char) =>
      _copyWith(obscuringCharacter: char);

  /// Enables or disables autocorrect.
  TextField autocorrect([bool value = true]) => _copyWith(autocorrect: value);

  /// Enables or disables suggestions.
  TextField suggestions([bool value = true]) =>
      _copyWith(enableSuggestions: value);

  /// Sets maximum number of lines.
  TextField maxLines(int? count) => _copyWith(maxLines: count);

  /// Sets minimum number of lines.
  TextField minLines(int? count) => _copyWith(minLines: count);

  /// Expands to fill available space.
  TextField expands([bool value = true]) => _copyWith(expands: value);

  /// Sets maximum character length.
  TextField maxLength(int length) => _copyWith(maxLength: length);

  /// Enables or disables the text field.
  TextField enabled([bool value = true]) => _copyWith(enabled: value);

  /// Disables the text field.
  TextField disabled() => _copyWith(enabled: false);

  // ==================== Cursor Styling ====================

  /// Sets cursor color.
  TextField cursorColor(material.Color color) =>
      _copyWith(cursorColor: color);

  /// Sets cursor width.
  TextField cursorWidth(double width) => _copyWith(cursorWidth: width);

  /// Sets cursor height.
  TextField cursorHeight(double height) => _copyWith(cursorHeight: height);

  /// Sets cursor radius.
  TextField cursorRadius(material.Radius radius) =>
      _copyWith(cursorRadius: radius);

  // ==================== Callbacks ====================

  /// Called when the text changes.
  TextField onChanged(void Function(String) callback) =>
      _copyWith(onChanged: callback);

  /// Called when editing is complete.
  TextField onEditingComplete(void Function() callback) =>
      _copyWith(onEditingComplete: callback);

  /// Called when the user submits (presses enter/done).
  TextField onSubmitted(void Function(String) callback) =>
      _copyWith(onSubmitted: callback);

  /// Called when the field is tapped.
  TextField onTap(material.GestureTapCallback callback) =>
      _copyWith(onTap: callback);

  // ==================== Input Formatters ====================

  /// Sets input formatters.
  TextField inputFormatters(List<services.TextInputFormatter> formatters) =>
      _copyWith(inputFormatters: formatters);

  /// Allows only digits.
  TextField digitsOnly() => _copyWith(
        inputFormatters: [services.FilteringTextInputFormatter.digitsOnly],
      );

  /// Allows only letters.
  TextField lettersOnly() => _copyWith(
        inputFormatters: [
          services.FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
        ],
      );

  // ==================== Other ====================

  /// Sets keyboard appearance (light/dark).
  TextField keyboardAppearance(material.Brightness brightness) =>
      _copyWith(keyboardAppearance: brightness);

  /// Sets scroll padding.
  TextField scrollPadding(material.EdgeInsets padding) =>
      _copyWith(scrollPadding: padding);

  /// Enables or disables interactive selection.
  TextField interactiveSelection([bool value = true]) =>
      _copyWith(enableInteractiveSelection: value);

  /// Sets restoration ID for state restoration.
  TextField restorationId(String id) => _copyWith(restorationId: id);

  /// Enables or disables scribble (Apple Pencil input).
  TextField scribble([bool value = true]) =>
      _copyWith(scribbleEnabled: value);
}