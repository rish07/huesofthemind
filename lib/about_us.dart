import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'responsive_widget.dart';

class AboutUs extends StatelessWidget {
  List<Widget> _profilesSmallScreen = [
    Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: CircleAvatar(radius: 50),
            ),
            Text(
              'Name',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Caption',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    Card(
      color: Colors.red,
      child: Text('2'),
    ),
    Card(
      color: Colors.grey,
      child: Text('3'),
    ),
    Card(
      color: Colors.black,
      child: Text('4'),
    ),
  ];

  List<Widget> _profilesNormal = [
    Card(
      color: Colors.amber,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rishi Raj Singh',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My caption  diyucbuocn concoj wcwc iweujc ehc ejc e ciewhc jc oaj coa caj caihcc ajspaksmpxjas oha scojas oxkj asoh asoj scx',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'sunflower.png',
                    ),
                  ),
                  Text(
                    'Team Sahaara',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              Container(
                margin: ResponsiveWidget.isSmallScreen(context)
                    ? null
                    : EdgeInsets.only(top: 30),
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height * 0.5,
                width: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width * 0.5,
                child: CarouselSlider(
                  items: ResponsiveWidget.isSmallScreen(context)
                      ? _profilesSmallScreen
                      : _profilesNormal,
                  options: CarouselOptions(
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
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
