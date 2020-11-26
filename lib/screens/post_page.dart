import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hues/widgets/postCard.dart';
import 'package:http/http.dart' as http;
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/hand_cursor.dart';

import 'package:hues/utilities/responsive_widget.dart';
import 'dart:convert';
import 'package:hues/utilities/reusable_card.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

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
    return loading
        ? Container(
            decoration: BoxDecoration(color: appBarBg),
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
            color: appBarBg,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: !ResponsiveWidget.isSmallScreen(context)
                  ? ListView(
                      shrinkWrap: true,
                      controller: _controller,
                      children: <Widget>[
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
