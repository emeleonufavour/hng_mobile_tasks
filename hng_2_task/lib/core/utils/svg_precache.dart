import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hng_2_task/core/core.dart';

Future<void> svgPrecacheImage() async {
  final svgs = [];

  for (String element in svgs) {
    var loader = SvgAssetLoader(element);
    try {
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    } catch (_) {}
  }
}

void preNetworkCacheImage(String path) {
  precacheImage(
    ExtendedNetworkImageProvider(path),
    navigatorKey.currentContext!,
  );
}

void preCacheAssetImages(BuildContext context) {
  final images = [];

  for (String image in images) {
    precacheImage(ExtendedAssetImageProvider(image), context);
  }
}
