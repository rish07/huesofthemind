import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/widgets/custom_button.dart';

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
                child: Row(
                  children: [
                    eventCard(
                      context,
                      imageAssetLink: 'empower.png',
                      eventName: "Empower: Where Empathy is Your Power",
                      readMore: 'https://empower-hotm.web.app/#/',
                    ),
                    eventCard(
                      context,
                      imageAssetLink: 'empower.png',
                      eventName: "Empower: Where Empathy is Your Power",
                      readMore: 'https://empower-hotm.web.app/#/',
                    ),
                    eventCard(
                      context,
                      imageAssetLink: 'empower.png',
                      eventName: "Empower: Where Empathy is Your Power",
                      readMore: 'https://empower-hotm.web.app/#/',
                    ),
                  ],
                ),
              ),
            ),
            customButton(
              title: 'Know More!',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Expanded eventCard(BuildContext context,
      {String eventName, String imageAssetLink, String readMore}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset(imageAssetLink),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  eventName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        ResponsiveWidget.isMediumScreen(context) ? 18 : 24,
                  ),
                ),
              ),
              Padding(
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
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      onPressed: () {
                        html.window.open(readMore, 'Post Link');
                      },
                      child: Text(
                        'Read More',
                        style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isLargeScreen(context) ? 18 : 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
