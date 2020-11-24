import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/responsive_widget.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  ScrollController _controller = ScrollController();
  Timer _timer;

  @override
  void initState() {
    if (loading == true) {
      _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {});
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitWave(
                  color: Colors.black,
                  type: SpinKitWaveType.start,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : Container(
            height: ResponsiveWidget.isSmallScreen(context)
                ? MediaQuery.of(context).size.height * 0.9
                : MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: !ResponsiveWidget.isSmallScreen(context)
                  ? Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    'Stories by the ',
                                    style: TextStyle(
                                      fontSize: ResponsiveWidget.isLargeScreen(
                                              context)
                                          ? 22
                                          : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'people',
                                    style: TextStyle(
                                      color: yellowColor,
                                      fontSize: ResponsiveWidget.isLargeScreen(
                                              context)
                                          ? 22
                                          : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              RaisedButton(
                                color: Colors.white,
                                hoverColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                  color: yellowColor,
                                  width: 3,
                                )),
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 32,
                                ),
                                onPressed: () {
                                  html.window.open(
                                      'https://docs.google.com/forms/d/e/1FAIpQLSdSdZpFd4Re9tdOH0rHrYZFk1pW5P3yjqkooEg7dPLx4RrQEw/viewform',
                                      'Post Link');
                                },
                                child: Text(
                                  'Want to share your story?',
                                  style: TextStyle(
                                    fontSize:
                                        ResponsiveWidget.isLargeScreen(context)
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
                        Row(
                            children: ResponsiveWidget.isLargeScreen(context)
                                ? cardsTopLarge
                                : cardsTopMedium),
                        Row(
                            children: ResponsiveWidget.isLargeScreen(context)
                                ? cardsBottomLarge
                                : cardsBottomMedium),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List<Widget>.generate(24, (index) {
                              return GestureDetector(
                                onTap: () {
                                  html.window.open(
                                      posts[index]['permalink'], 'instaId');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              posts[index]['media_url']),
                                          fit: BoxFit.fill),
                                    ),
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
            ),
          );
  }
}
