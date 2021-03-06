import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hues/screens/about_events.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/widgets/custom_button.dart';
import 'package:page_transition/page_transition.dart';

class RecentEvents extends StatefulWidget {
  @override
  _RecentEventsState createState() => _RecentEventsState();
}

class _RecentEventsState extends State<RecentEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 26,
                  width: 20,
                  child: VerticalDivider(
                    width: 2,
                    thickness: 4,
                    color: yellowColor,
                  ),
                ),
                Text(
                  'Recent ',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Events',
                  style: TextStyle(
                    color: yellowColor,
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: !ResponsiveWidget.isSmallScreen(context)
                    ? Row(
                        children: [
                          eventCard(
                            context,
                            imageAssetLink: 'empower.png',
                            eventName: "Empower: Where Empathy is Your Power",
                            readMore: 'https://empower-hotm.web.app/#/',
                          ),
                          eventCard(
                            context,
                            imageAssetLink: 'beKind.jpeg',
                            eventName: "How to be Kind to Your Mind",
                            readMore:
                                'https://www.instagram.com/tv/CErTUJAC262/',
                          ),
                          eventCard(
                            context,
                            imageAssetLink: 'soulful.jpg',
                            eventName: "Soulful- Connecting with Yourself",
                            readMore:
                                'https://www.instagram.com/p/CIBEb5NhdZ0/',
                          ),
                        ],
                      )
                    : CarouselSlider(
                        items: [
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              Container(
                                child: eventCard(
                                  context,
                                  imageAssetLink: 'empower.png',
                                  eventName:
                                      "Empower: Where Empathy is Your Power",
                                  readMore: 'https://empower-hotm.web.app/#/',
                                ),
                              ),
                            ],
                          ),
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              Container(
                                child: eventCard(
                                  context,
                                  imageAssetLink: 'beKind.jpeg',
                                  eventName: "How to be Kind to Your Mind",
                                  readMore:
                                      'https://www.instagram.com/tv/CErTUJAC262/',
                                ),
                              ),
                            ],
                          ),
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              Container(
                                child: eventCard(
                                  context,
                                  imageAssetLink: 'soulful.jpg',
                                  eventName:
                                      "Soulful- Connecting with Yourself",
                                  readMore:
                                      'https://www.instagram.com/p/CIBEb5NhdZ0/',
                                ),
                              ),
                            ],
                          ),
                        ],
                        options: CarouselOptions(
                          height: 400.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                        ),
                      ),
              ),
            ),
            customButton(
              title: 'Know More!',
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: AboutEvents(),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded eventCard(BuildContext context,
      {String eventName,
      String imageAssetLink,
      String readMore,
      bool isSmall = false}) {
    return Expanded(
      child: Container(
        width: isSmall ? MediaQuery.of(context).size.width * 0.9 : null,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          elevation: isSmall ? 8 : 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: !ResponsiveWidget.isSmallScreen(context) ? 4 : 2,
                child: Container(
                  child: Image.asset(
                    imageAssetLink,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 8.0,right:8 ,top: 12,bottom: 8),
                    child: Text(
                      eventName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ResponsiveWidget.isLargeScreen(context) ? 24 : 18,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.white,
                          hoverColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                            color: yellowColor,
                            width: 3,
                          )),
                          padding: isSmall
                              ? EdgeInsets.all(8)
                              : EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 32,
                                ),
                          onPressed: () {
                            html.window.open(readMore, 'Post Link');
                          },
                          child: Text(
                            'Read More',
                            style: TextStyle(
                              fontSize: isSmall
                                  ? 12
                                  : ResponsiveWidget.isLargeScreen(context)
                                      ? 18
                                      : 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
