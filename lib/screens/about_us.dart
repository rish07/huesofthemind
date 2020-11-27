import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';

import '../utilities/profile_data.dart';
import '../utilities/responsive_widget.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.white,
                    hoverColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                      color: yellowColor,
                      width: 3,
                    )),
                    padding: ResponsiveWidget.isSmallScreen(context)
                        ? EdgeInsets.all(8)
                        : EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                    onPressed: () {
                      html.window.open(
                          'https://www.instagram.com/huesofthemind/',
                          'Post Link');
                    },
                    child: Text(
                      'View More Posts',
                      style: TextStyle(
                        fontSize: ResponsiveWidget.isLargeScreen(context)
                            ? 18
                            : ResponsiveWidget.isMediumScreen(context)
                                ? 14
                                : 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                  'Meet the Team ',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sahaara',
                  style: TextStyle(
                    color: yellowColor,
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'We are here to help each other by sharing, learning, coping, and healing together. Here\'s to that!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveWidget.isLargeScreen(context)
                      ? 24
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 16
                          : 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: ResponsiveWidget.isSmallScreen(context)
                      ? null
                      : EdgeInsets.only(top: 30),
                  height: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.height * 0.6
                      : ResponsiveWidget.isLargeScreen(context)
                          ? MediaQuery.of(context).size.height * 0.32
                          : MediaQuery.of(context).size.height * 0.4,
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? MediaQuery.of(context).size.width * 0.8
                      : MediaQuery.of(context).size.width * 0.5,
                  child: CarouselSlider(
                    items: !ResponsiveWidget.isLargeScreen(context)
                        ? profilesSmallScreen
                        : profilesNormal,
                    options: CarouselOptions(
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayCurve: Curves.easeIn,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ResponsiveWidget.isSmallScreen(context)
                      ? profilesSmallScreen.map((url) {
                          int index = profilesSmallScreen.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList()
                      : profilesNormal.map((url) {
                          int index = profilesNormal.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
