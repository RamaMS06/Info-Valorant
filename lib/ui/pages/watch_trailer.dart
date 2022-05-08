import 'package:flutter/services.dart';
import 'package:infovalorant/db/infovalorantdb.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/model/watch.dart';
import 'package:infovalorant/ui/core/core_widget.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

    listTrailer = await InfoValorantDB.instance.readAllTrailer();
    // InfoValorantDB.instance.deleteAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_fields
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CoreWidget.appBarCustom(context, 'Watch Trailer'),
        backgroundColor: CoreColors.white,
        body: SafeArea(
            child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : listDefaultTrailer.isEmpty
                        ? dataEmpty()
                        : ListView.builder(
                            itemCount: listDefaultTrailer.length,
                            itemBuilder: (context, index) => Center(
                                  child: cardTrailer(context,
                                      item: listDefaultTrailer[index]),
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

Widget cardTrailer(context, {required WatchTrailerModel item}) =>
    Stack(clipBehavior: Clip.hardEdge, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: CoreWidget.customCard(
          25.0,
          15.0,
          InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                isScrollControlled: true,
                builder: (BuildContext context) => buildSheet(context, item)),
            child: Wrap(children: [
              CoreWidget.customClip(
                  CoreWidget.imageCache(item.image, double.infinity, 200),
                  const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    top: 15, left: 25, right: 25, bottom: 20),
                child:
                    Flexible(child: textSilver(item.desc, 10, FontWeight.w400)),
              )
            ]),
          ),
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

Widget buildSheet(context, WatchTrailerModel item) {
  String? videoUrl = YoutubePlayer.convertUrlToId(item.url);

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoUrl!,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false));

  return FractionallySizedBox(
    heightFactor: 0.69,
    child: Stack(
      children: [
        Positioned(
            top: 29,
            right: -25,
            child: textSilver('WE ARE VALORANT', 30, FontWeight.bold)),
        Column(
          children: [
            const SizedBox(height: 15),
            CoreWidget.customClip(
                Container(
                  height: 4,
                  width: 35,
                  color: CoreColors.silver,
                ),
                const BorderRadius.all(Radius.circular(25))),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 25, right: 25, bottom: 25),
              child: Wrap(children: [
                CoreWidget.customCard(
                  15.0,
                  15.0,
                  CoreWidget.customClip(
                      YoutubePlayer(
                        progressIndicatorColor: CoreColors.colorPrimary,
                        controller: _controller,
                        aspectRatio: 500 / 500,
                      ),
                      const BorderRadius.all(Radius.circular(15))),
                ),
              ]),
            ),
            Padding(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image.asset(
                  'assets/riot_icon.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Flexible(child: textBlack(item.title, 16, FontWeight.bold))
              ]),
              padding: const EdgeInsets.symmetric(horizontal: 25),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 75, top: 15, right: 40),
                child: textBlack(item.desc, 10, FontWeight.normal))
          ],
        ),
        _customLine(
            top: 25, left: 20, color: CoreColors.black, height: 15, width: 15),
        _customLine(
            top: 25,
            left: 10,
            color: CoreColors.colorPrimary,
            width: 1,
            height: 80),
      ],
    ),
  );
}

Widget _customLine(
    {double? top,
    double? left,
    double? right,
    double? bottom,
    required Color color,
    required double height,
    required double width}) {
  return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: _customShadow(color, height, width));
}

Widget _customShadow(Color color, double height, double width) {
  return Card(
      shadowColor: color,
      elevation: 4,
      child: Container(color: color, height: height, width: width));
}
