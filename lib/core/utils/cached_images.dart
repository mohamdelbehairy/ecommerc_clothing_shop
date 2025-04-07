import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class CachedImages {
  static const _svgImages = [
    Assets.imagesBack,
    Assets.imagesBag2,
    Assets.imagesCoupon,
    Assets.imagesEmptyCard,
    Assets.imagesFacebook,
    Assets.imagesFav,
    Assets.imagesFilter,
    Assets.imagesGithub,
    Assets.imagesGoogle,
    Assets.imagesHome2,
    Assets.imagesNotificationbing,
    Assets.imagesOrders,
    Assets.imagesProfile,
    Assets.imagesSearch,
    Assets.imagesSigninSuccess,
    Assets.imagesTwitter,
    Assets.imagesUnfav
  ];

  static const _pngImages = [
    Assets.imagesAccessories,
    Assets.imagesAppLogo,
    Assets.imagesBag,
    Assets.imagesCheckEmail,
    Assets.imagesHoodies,
    Assets.imagesNoOrders,
    Assets.imagesNoSearch,
    Assets.imagesNotify,
    Assets.imagesOne,
    Assets.imagesOrderPlaced,
    Assets.imagesShoes,
    Assets.imagesShorts,
    Assets.imagesThree,
    Assets.imagesTwo
  ];

  static Future<void> _loadSvgImages() async {
    for (var image in _svgImages) {
      final loader = SvgAssetLoader(image);

      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }

  static Future<void> _loadPngImages(BuildContext context) async {
    for (var image in _pngImages) {
      await precacheImage(AssetImage(image), context);
    }
  }

  static Future<void> loadImages(BuildContext context) async {
    await Future.wait([
      _loadSvgImages(),
      _loadPngImages(context),
    ]);
  }
}
