/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage banner1 = AssetGenImage('assets/banner1.png');
  static const AssetGenImage banner2 = AssetGenImage('assets/banner2.png');
  static const AssetGenImage flight = AssetGenImage('assets/flight.png');
  static const AssetGenImage flightBanner =
      AssetGenImage('assets/flight_banner.png');
  static const AssetGenImage icDoubleArrow =
      AssetGenImage('assets/ic_double_arrow.png');
  static const AssetGenImage icHome = AssetGenImage('assets/ic_home.png');
  static const AssetGenImage icOrder = AssetGenImage('assets/ic_order.png');
  static const AssetGenImage icTask = AssetGenImage('assets/ic_task.png');
  static const AssetGenImage team1 = AssetGenImage('assets/team1.png');
  static const AssetGenImage team2 = AssetGenImage('assets/team2.png');
  static const AssetGenImage team3 = AssetGenImage('assets/team3.png');
  static const AssetGenImage train = AssetGenImage('assets/train.png');
  static const AssetGenImage trainBanner =
      AssetGenImage('assets/train_banner.png');

  /// List of all assets
  static List<AssetGenImage> get values => [
        banner1,
        banner2,
        flight,
        flightBanner,
        icDoubleArrow,
        icHome,
        icOrder,
        icTask,
        team1,
        team2,
        team3,
        train,
        trainBanner
      ];
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
