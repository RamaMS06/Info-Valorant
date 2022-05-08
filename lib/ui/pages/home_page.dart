import 'package:infovalorant/ui/core/core_widget.dart';
import 'package:infovalorant/util/colors.dart';
import 'package:infovalorant/extension/widget_extension.dart';
import 'package:infovalorant/model/news.dart';
import 'package:infovalorant/ui/pages/watch_trailer.dart';
import 'package:infovalorant/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBarCustom(
          'ic_menu.png', 'ic_agents.png', 'ic_map.png', CoreColors.white),
      backgroundColor: CoreColors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: 1500,
          child: Stack(
            children: [
              headerHome(context),
              Positioned.fill(
                  top: 260,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: CoreColors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(35))),
                    child: Stack(children: [
                      Positioned.fill(
                        right: 0,
                        top: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: Colors.grey,
                              height: 1,
                              width: 170,
                              margin: const EdgeInsets.only(right: 25),
                            ),
                            Container(
                              color: CoreColors.colorPrimary,
                              height: 12,
                              width: 18,
                              margin: const EdgeInsets.only(top: 5, right: 25),
                            )
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: 35,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.0)
                              ],
                              stops: const [0.85, 1],
                            ).createShader(bounds);
                          },
                          child: SizedBox(
                            height: 170,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 23,
                                  child: textRed('NEWS', 26, FontWeight.bold),
                                ),
                                Positioned(
                                    right: 15,
                                    top: 5,
                                    child: textRed('GO TO NEWS PAGE', 10,
                                        FontWeight.bold)),
                                Positioned(
                                  top: 26.5,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.only(left: 25),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    separatorBuilder: (context, _) =>
                                        const SizedBox(width: 25),
                                    itemBuilder: (context, index) =>
                                        newsCard(item: agentList[index]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          top: 220,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 25),
                                    child: textBlack(
                                        'WE ARE VALORANT', 22, FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textBlack('DEFY THE LIMITS', 14,
                                                FontWeight.bold),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            textBlack(
                                                CoreString.desc_defy_limits,
                                                10,
                                                FontWeight.normal)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Material(
                                            shadowColor:
                                                CoreColors.colorPrimary,
                                            elevation: 6,
                                            child: CoreWidget.imageCache(
                                                CoreString.url_defy_limits,
                                                100,
                                                160)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

Widget headerHome(context) => Positioned.fill(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: CoreString.url_header_gif,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 280,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 20),
            child: Center(
              child: Column(
                children: [
                  textWhite('A 5v5 character-based tactical shooter', 12,
                      FontWeight.normal),
                  const SizedBox(height: 14),
                  Image.asset("assets/ValorantRed.png",
                      height: 80, width: MediaQuery.of(context).size.width),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: CoreColors.white),
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: CoreColors.colorPrimary,
                              side: BorderSide.none),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            child: textWhite('WATCH', 10, FontWeight.w700),
                          ),
                          onPressed: () => {_nextPage(context)}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
//For News Valorant listview layout
Widget newsCard({
  required News item,
}) =>
    SizedBox(
      width: 190,
      child: Column(children: [
        Material(
            shadowColor: CoreColors.colorPrimary,
            elevation: 6,
            child: Image.asset(
              item.image,
              fit: BoxFit.fitWidth,
              height: 100,
              width: 190,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(children: [
              textBlack(item.dateAgents, 10, FontWeight.w100),
              const SizedBox(width: 10),
              textRed('GAMES UPDATE', 10, FontWeight.bold)
            ]),
            const SizedBox(height: 6),
            textBlack(item.updateAgents, 12, FontWeight.bold)
          ],
        )
      ]),
    );

//Bottom Navigation Bar
Widget navBarCustom(
        String icon1, String icon2, String icon3, Color customColor) =>
    Material(
      color: Colors.transparent,
      child: CurvedNavigationBar(
        height: 70.0,
        backgroundColor: customColor,
        color: CoreColors.colorPrimary,
        items: [
          Image.asset('assets/' + icon1, height: 30, width: 30),
          Image.asset('assets/' + icon2, height: 30, width: 30),
          Image.asset('assets/' + icon3, height: 30, width: 30)
        ],
        onTap: (index) {},
      ),
    );

//Function
void _nextPage(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => WatchTrailer()));
}
