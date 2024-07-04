/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-Italic.ttf
  String get poppinsItalic => 'assets/fonts/Poppins-Italic.ttf';

  /// File path: assets/fonts/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        poppinsBold,
        poppinsItalic,
        poppinsLight,
        poppinsMedium,
        poppinsRegular,
        poppinsSemiBold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_anggur.svg
  String get iconAnggur => 'assets/icons/icon_anggur.svg';

  /// File path: assets/icons/icon_calendar.svg
  String get iconCalendar => 'assets/icons/icon_calendar.svg';

  /// File path: assets/icons/icon_cuaca.svg
  String get iconCuaca => 'assets/icons/icon_cuaca.svg';

  /// File path: assets/icons/icon_hama.svg
  String get iconHama => 'assets/icons/icon_hama.svg';

  /// File path: assets/icons/icon_maps.svg
  String get iconMaps => 'assets/icons/icon_maps.svg';

  /// File path: assets/icons/icon_modul.svg
  String get iconModul => 'assets/icons/icon_modul.svg';

  /// File path: assets/icons/icon_penyakit.svg
  String get iconPenyakit => 'assets/icons/icon_penyakit.svg';

  /// List of all assets
  List<String> get values => [
        iconAnggur,
        iconCalendar,
        iconCuaca,
        iconHama,
        iconMaps,
        iconModul,
        iconPenyakit
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/splash_screen.jpg
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.jpg');

  /// File path: assets/images/testing_1.jpg
  AssetGenImage get testing1 =>
      const AssetGenImage('assets/images/testing_1.jpg');

  /// File path: assets/images/testing_2.jpg
  AssetGenImage get testing2 =>
      const AssetGenImage('assets/images/testing_2.jpg');

  /// File path: assets/images/testing_3.jpg
  AssetGenImage get testing3 =>
      const AssetGenImage('assets/images/testing_3.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [splashScreen, testing1, testing2, testing3];
}

class $AssetsMapsGen {
  const $AssetsMapsGen();

  /// File path: assets/maps/map_style.json
  String get mapStyle => 'assets/maps/map_style.json';

  /// List of all assets
  List<String> get values => [mapStyle];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMapsGen maps = $AssetsMapsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
    bool gaplessPlayback = false,
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
