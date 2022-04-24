import 'package:cached_network_image/cached_network_image.dart';
import 'package:infovalorant/db/infovalorantdb.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/model/watch.dart';
import 'package:infovalorant/ui/core/core_widget.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:flutter/material.dart';

class WatchTrailer extends StatefulWidget {
  @override
  State<WatchTrailer> createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {
  late List<WatchTrailerModel> listTrailer;
  late WatchTrailerModel trailer;


  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshTrailer();
  }

  Future refreshTrailer() async {
    setState(() {
      isLoading = true;
    });

    // InfoValorantDB.instance.create(trailer);
    

    listTrailer = await InfoValorantDB.instance.readAllTrailer();
    InfoValorantDB.instance.deleteAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CoreWidget.appBarCustom(context),
        backgroundColor: CoreColors.white,
        body: SafeArea(
            child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : listTrailer.isEmpty
                        ? dataEmpty()
                        : ListView.builder(
                            itemCount: listTrailer.length,
                            itemBuilder: (context, index) => Center(
                                  child: cardTrailer(item: listTrailer[index]),
                                )))));
  }
}

Widget dataEmpty() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoreWidget.imageCache(
              'https://c.tenor.com/ksu0bUfO9akAAAAi/boombot.gif', 100, 100),
          const SizedBox(height: 20),
          textBlack('Woops! data is gone?', 16, FontWeight.w600)
        ],
      ),
    );

Widget cardTrailer({required WatchTrailerModel item}) =>
    Stack(clipBehavior: Clip.hardEdge, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 15,
          child: Wrap(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                  child:
                      CoreWidget.imageCache(item.image, double.infinity, 180),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/riot_icon.png',
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(child: textBlack(item.title, 14, FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 25, right: 25, bottom: 15),
                child: textBlack(item.desc, 9, FontWeight.w400),
              )
            ]),
          ]),
        ),
      ),
      Positioned(
          right: 20,
          top: 10,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              elevation: 15,
              child: SizedBox(
                height: 40,
                width: 40,
                child: Center(child: textRed(item.number, 21, FontWeight.bold)),
              ))),
    ]);
