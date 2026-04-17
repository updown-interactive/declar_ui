// ------------------------------------------------------------ //
//  image.dart
// ------------------------------------------------------------ //

import 'dart:io' as io;
import 'dart:typed_data' as typed_data;

import 'package:flutter/material.dart' as material;

/// A declarative wrapper around Flutter’s [Image] widget that supports
/// fluent-style chaining through extension methods.
class Image extends material.StatelessWidget {
  final material.ImageProvider _image;
  final double? _width;
  final double? _height;
  final material.BoxFit? _fit;
  final material.AlignmentGeometry _alignment;
  final material.ImageRepeat _repeat;
  final material.Color? _color;
  final material.BlendMode? _colorBlendMode;

  const Image({
    super.key,
    required material.ImageProvider image,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry alignment = material.Alignment.center,
    material.ImageRepeat repeat = material.ImageRepeat.noRepeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  })  : _image = image,
        _width = width,
        _height = height,
        _fit = fit,
        _alignment = alignment,
        _repeat = repeat,
        _color = color,
        _colorBlendMode = colorBlendMode;

  Image.network(
    String url, {
    super.key,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry alignment = material.Alignment.center,
    material.ImageRepeat repeat = material.ImageRepeat.noRepeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  })  : _image = material.NetworkImage(url),
        _width = width,
        _height = height,
        _fit = fit,
        _alignment = alignment,
        _repeat = repeat,
        _color = color,
        _colorBlendMode = colorBlendMode;

  Image.asset(
    String name, {
    super.key,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry alignment = material.Alignment.center,
    material.ImageRepeat repeat = material.ImageRepeat.noRepeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  })  : _image = material.AssetImage(name),
        _width = width,
        _height = height,
        _fit = fit,
        _alignment = alignment,
        _repeat = repeat,
        _color = color,
        _colorBlendMode = colorBlendMode;

  Image.file(
    io.File file, {
    super.key,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry alignment = material.Alignment.center,
    material.ImageRepeat repeat = material.ImageRepeat.noRepeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  })  : _image = material.FileImage(file),
        _width = width,
        _height = height,
        _fit = fit,
        _alignment = alignment,
        _repeat = repeat,
        _color = color,
        _colorBlendMode = colorBlendMode;

  Image.memory(
    typed_data.Uint8List bytes, {
    super.key,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry alignment = material.Alignment.center,
    material.ImageRepeat repeat = material.ImageRepeat.noRepeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  })  : _image = material.MemoryImage(bytes),
        _width = width,
        _height = height,
        _fit = fit,
        _alignment = alignment,
        _repeat = repeat,
        _color = color,
        _colorBlendMode = colorBlendMode;

  Image _copyWith({
    material.ImageProvider? image,
    double? width,
    double? height,
    material.BoxFit? fit,
    material.AlignmentGeometry? alignment,
    material.ImageRepeat? repeat,
    material.Color? color,
    material.BlendMode? colorBlendMode,
  }) {
    return Image(
      key: key,
      image: image ?? _image,
      width: width ?? _width,
      height: height ?? _height,
      fit: fit ?? _fit,
      alignment: alignment ?? _alignment,
      repeat: repeat ?? _repeat,
      color: color ?? _color,
      colorBlendMode: colorBlendMode ?? _colorBlendMode,
    );
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Image(
      key: key,
      image: _image,
      width: _width,
      height: _height,
      fit: _fit,
      alignment: _alignment,
      repeat: _repeat,
      color: _color,
      colorBlendMode: _colorBlendMode,
    );
  }
}

// MARK: - Extension

extension ImageExtension on Image {
  Image width(double width) => _copyWith(width: width);
  Image height(double height) => _copyWith(height: height);
  Image size({double? width, double? height}) =>
      _copyWith(width: width, height: height);
  Image square(double size) => _copyWith(width: size, height: size);

  Image fit(material.BoxFit fit) => _copyWith(fit: fit);
  Image alignment(material.AlignmentGeometry alignment) =>
      _copyWith(alignment: alignment);
  Image repeat(material.ImageRepeat repeat) => _copyWith(repeat: repeat);

  Image color(material.Color color,
          {material.BlendMode blendMode = material.BlendMode.srcIn}) =>
      _copyWith(color: color, colorBlendMode: blendMode);
}
