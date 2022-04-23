import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/model/watch.dart';
import 'package:infovalorant/ui/core/core_widget.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WatchTrailer extends StatelessWidget {
  late final db = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;

  showData() {
    db.once().then((snapshot) {
      print(snapshot.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CoreWidget.appBarCustom(context),
        backgroundColor: CoreColors.white,
        body: SafeArea(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listTrailer.length,
            itemBuilder: (context, index) =>
                cardTrailer(item: listTrailer[index]),
          ),
        ));
  }
}

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
                  child: CachedNetworkImage(
                      height: 180,
                      fit: BoxFit.cover,
                      imageUrl: item.image,
                      placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: CoreColors.colorPrimary,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error)),
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
          top: 15,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              elevation: 15,
              child: Container(
                height: 40,
                width: 40,
                child: Center(child: textRed(item.index, 21, FontWeight.bold)),
              ))),
    ]);
