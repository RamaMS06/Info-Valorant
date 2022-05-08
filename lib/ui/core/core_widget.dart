import 'package:cached_network_image/cached_network_image.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:flutter/material.dart';

class CoreWidget {
  static PreferredSizeWidget appBarCustom(BuildContext context, String title) =>
      AppBar(
        backgroundColor: CoreColors.colorPrimary,
        elevation: 8,
        shadowColor: CoreColors.colorPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: textWhite(title, 16, FontWeight.bold),
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

  static Widget customCard(double radius, double elevation, Widget child) =>
      Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        elevation: elevation,
        shadowColor: CoreColors.silver,
        child: child,
      );

  static Widget customClip(Widget child, BorderRadius border) =>
      ClipRRect(child: child, borderRadius: border);
}
