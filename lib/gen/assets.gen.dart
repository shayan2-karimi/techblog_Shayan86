/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $FontsGen {
  const $FontsGen();

  /// File path: fonts/Ubuntu-Bold.ttf
  String get ubuntuBold => 'fonts/Ubuntu-Bold.ttf';

  /// File path: fonts/Ubuntu-BoldItalic.ttf
  String get ubuntuBoldItalic => 'fonts/Ubuntu-BoldItalic.ttf';

  /// File path: fonts/Ubuntu-Italic.ttf
  String get ubuntuItalic => 'fonts/Ubuntu-Italic.ttf';

  /// File path: fonts/Ubuntu-Light.ttf
  String get ubuntuLight => 'fonts/Ubuntu-Light.ttf';

  /// File path: fonts/Ubuntu-LightItalic.ttf
  String get ubuntuLightItalic => 'fonts/Ubuntu-LightItalic.ttf';

  /// File path: fonts/Ubuntu-Medium.ttf
  String get ubuntuMedium => 'fonts/Ubuntu-Medium.ttf';

  /// File path: fonts/Ubuntu-MediumItalic.ttf
  String get ubuntuMediumItalic => 'fonts/Ubuntu-MediumItalic.ttf';

  /// File path: fonts/Ubuntu-Regular.ttf
  String get ubuntuRegular => 'fonts/Ubuntu-Regular.ttf';

  /// List of all assets
  List<String> get values => [
        ubuntuBold,
        ubuntuBoldItalic,
        ubuntuItalic,
        ubuntuLight,
        ubuntuLightItalic,
        ubuntuMedium,
        ubuntuMediumItalic,
        ubuntuRegular
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Profile_Avator.png
  AssetGenImage get profileAvator =>
      const AssetGenImage('assets/images/Profile_Avator.png');

  /// Directory path: assets/images/icons
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// File path: assets/images/logo_Tech.png
  AssetGenImage get logoTech =>
      const AssetGenImage('assets/images/logo_Tech.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/w3c (1).svg
  SvgGenImage get w3c1 => const SvgGenImage('assets/images/w3c (1).svg');

  /// List of all assets
  List<dynamic> get values => [profileAvator, logoTech, programming, w3c1];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/Microphone.png
  AssetGenImage get microphone =>
      const AssetGenImage('assets/images/icons/Microphone.png');

  /// File path: assets/images/icons/hashTag.png
  AssetGenImage get hashTag =>
      const AssetGenImage('assets/images/icons/hashTag.png');

  /// File path: assets/images/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icons/icon.png');

  /// File path: assets/images/icons/iconFlash.png
  AssetGenImage get iconFlash =>
      const AssetGenImage('assets/images/icons/iconFlash.png');

  /// File path: assets/images/icons/pencel.png
  AssetGenImage get pencel =>
      const AssetGenImage('assets/images/icons/pencel.png');

  /// File path: assets/images/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/icons/user.png');

  /// File path: assets/images/icons/w.png
  AssetGenImage get w => const AssetGenImage('assets/images/icons/w.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [microphone, hashTag, icon, iconFlash, pencel, user, w];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $FontsGen fonts = $FontsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
