import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utilities/responsive_widget.dart';

import '../utilities/profile_data.dart';

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
      color: Color(0xFFFAF3EA),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'sunflower.png',
                  ),
                ),
                Flexible(
                  child: Text(
                    'Team Sahaara',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 40,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: ResponsiveWidget.isSmallScreen(context) ? null : EdgeInsets.only(top: 30),
                  height: ResponsiveWidget.isSmallScreen(context) ? MediaQuery.of(context).size.height * 0.7 : MediaQuery.of(context).size.height * 0.32,
                  width: ResponsiveWidget.isSmallScreen(context) ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.5,
                  child: CarouselSlider(
                    items: !ResponsiveWidget.isLargeScreen(context) ? profilesSmallScreen : profilesNormal,
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
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList()
                      : profilesNormal.map((url) {
                          int index = profilesNormal.indexOf(url);
                          return Container(
                            width: 8.5,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
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
