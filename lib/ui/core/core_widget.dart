import 'package:cached_network_image/cached_network_image.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:flutter/material.dart';

class CoreWidget {
  static PreferredSizeWidget appBarCustom(BuildContext context) => AppBar(
        backgroundColor: CoreColors.colorPrimary,
        elevation: 8,
        shadowColor: CoreColors.colorPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: textWhite('Watch Trailer', 16, FontWeight.bold),
      );

  static Widget imageCache(String url, double width, double height) =>
      CachedNetworkImage(
          width: width,
          height: height,
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: CoreColors.colorPrimary,
                ),
              ),
          errorWidget: (context, url, error) => const Icon(Icons.error));
}
