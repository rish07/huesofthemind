import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:hues/constants.dart';

import 'package:hues/responsive_widget.dart';
import 'dart:convert';
import 'package:hues/reusable_card.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Widget> cardsTopLarge = [];
  List<Widget> cardsBottomLarge = [];
  List<Widget> cardsTopMedium = [];
  List<Widget> cardsBottomMedium = [];
  ScrollController _controller = ScrollController();
  bool _loading = true;
  String temp;
  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=IGQVJXbkZADVTd1VERjQUQ5UmRZAeWhLTGt2U1REWWNvUFhVMDlQekwtTjYwUkFtNl8wN1JrOHc3bWlyMTNaenQzSXpsb1RTYXlTMG81SGlNSWZANMEFhMkRvMV81eDE2eEw1cVU3QTNB";
  List posts = [];
  Future fetchPosts() async {
    print('working=============================');
    var result = await http.get(
      apiUrl,
    );
    posts = json.decode(result.body)['data'];
    print(posts[0]['media_url']);
    setState(() {
      print(posts.length);
      temp = posts[0]['media_url'];
      for (var i = 0; i < 6; i++) {
        cardsTopLarge.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        cardsBottomLarge.add(
          postCard(
              postLink: posts[i + 6]['permalink'],
              caption: posts[i + 6]['caption'],
              imageUrl: posts[i + 6]['media_url']),
        );
      }
      for (var i = 0; i < 4; i++) {
        cardsTopMedium.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        cardsBottomMedium.add(
          postCard(
              postLink: posts[i + 4]['permalink'],
              caption: posts[i + 4]['caption'],
              imageUrl: posts[i + 4]['media_url']),
        );
      }
      setState(() {
        _loading = false;
      });
    });

    return posts;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
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
                            children: List<Widget>.generate(15, (index) {
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

  Expanded postCard({String caption, String imageUrl, String postLink}) {
    return Expanded(
      child: ReusableCard(
        colour: Colors.white,
        cardChild: Container(
          height: 460,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: ResponsiveWidget.isSmallScreen(context) ? 150 : 250,
                  child: Image.network(imageUrl, fit: BoxFit.fitHeight),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  caption,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                    elevation: 10,
                    child: AutoSizeText(
                      'Read more',
                      maxLines: 1,
                    ),
                    color: appBarBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      html.window.open(postLink, 'Post Link');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
