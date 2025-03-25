/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow.svg
  String get icArrow => 'assets/icons/ic_arrow.svg';

  /// File path: assets/icons/ic_arrow_left.svg
  String get icArrowLeft => 'assets/icons/ic_arrow_left.svg';

  /// File path: assets/icons/ic_cart.svg
  String get icCart => 'assets/icons/ic_cart.svg';

  /// File path: assets/icons/ic_delete.svg
  String get icDelete => 'assets/icons/ic_delete.svg';

  /// File path: assets/icons/ic_eye.png
  AssetGenImage get icEyePng => const AssetGenImage('assets/icons/ic_eye.png');

  /// File path: assets/icons/ic_eye.svg
  String get icEyeSvg => 'assets/icons/ic_eye.svg';

  /// File path: assets/icons/ic_fav.svg
  String get icFav => 'assets/icons/ic_fav.svg';

  /// File path: assets/icons/ic_fav_filled.svg
  String get icFavFilled => 'assets/icons/ic_fav_filled.svg';

  /// File path: assets/icons/ic_fav_outlined.svg
  String get icFavOutlined => 'assets/icons/ic_fav_outlined.svg';

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_logout.svg
  String get icLogout => 'assets/icons/ic_logout.svg';

  /// File path: assets/icons/ic_minus_circle.svg
  String get icMinusCircle => 'assets/icons/ic_minus_circle.svg';

  /// File path: assets/icons/ic_plus_circle.svg
  String get icPlusCircle => 'assets/icons/ic_plus_circle.svg';

  /// File path: assets/icons/ic_star.svg
  String get icStar => 'assets/icons/ic_star.svg';

  /// List of all assets
  List<dynamic> get values => [
        icArrow,
        icArrowLeft,
        icCart,
        icDelete,
        icEyePng,
        icEyeSvg,
        icFav,
        icFavFilled,
        icFavOutlined,
        icHome,
        icLogout,
        icMinusCircle,
        icPlusCircle,
        icStar
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_welcome.jpg
  AssetGenImage get bgWelcome =>
      const AssetGenImage('assets/images/bg_welcome.jpg');

  /// File path: assets/images/ic_brand.png
  AssetGenImage get icBrand =>
      const AssetGenImage('assets/images/ic_brand.png');

  /// List of all assets
  List<AssetGenImage> get values => [bgWelcome, icBrand];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
