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
        title: textWhite('Watch Trailer', 14, FontWeight.bold),
      );
}
