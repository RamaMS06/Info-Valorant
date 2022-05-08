import 'package:flutter/material.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/ui/core/core_widget.dart';

class DetailWatchTrailer extends StatelessWidget {
  String url;
  DetailWatchTrailer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CoreWidget.appBarCustom(context, 'Detail Watch Trailer'),
      body: SafeArea(
          child: Column(
        children: [textBlack(url, 14, FontWeight.normal)],
      )),
    );
  }
}
