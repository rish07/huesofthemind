import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:hues/constants.dart';
import 'package:hues/landing_page.dart';
import 'package:hues/responsive_widget.dart';
import 'dart:convert';
import 'package:hues/reusable_card.dart';
import 'dart:html' as html;

import 'package:hues/submit_post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  ScrollController _controller = ScrollController();
  List<Widget> _cardsTopLarge = [];
  List<Widget> _cardsBottomLarge = [];
  List<Widget> _cardsTopMedium = [];
  List<Widget> _cardsBottomMedium = [];

  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=IGQVJXbkZADVTd1VERjQUQ5UmRZAeWhLTGt2U1REWWNvUFhVMDlQekwtTjYwUkFtNl8wN1JrOHc3bWlyMTNaenQzSXpsb1RTYXlTMG81SGlNSWZANMEFhMkRvMV81eDE2eEw1cVU3QTNB";
  List posts = [];
  String temp;

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
        _cardsTopLarge.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        _cardsBottomLarge.add(
          postCard(
              postLink: posts[i + 6]['permalink'],
              caption: posts[i + 6]['caption'],
              imageUrl: posts[i + 6]['media_url']),
        );
      }
      for (var i = 0; i < 4; i++) {
        _cardsTopMedium.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        _cardsBottomMedium.add(
          postCard(
              postLink: posts[i + 4]['permalink'],
              caption: posts[i + 4]['caption'],
              imageUrl: posts[i + 4]['media_url']),
        );
      }
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
    return Container(
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
                          ? _cardsTopLarge
                          : _cardsTopMedium),
                  Row(
                      children: ResponsiveWidget.isLargeScreen(context)
                          ? _cardsBottomLarge
                          : _cardsBottomMedium),
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
                            html.window
                                .open(posts[index]['permalink'], 'instaId');
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
                                    image:
                                        NetworkImage(posts[index]['media_url']),
                                    fit: BoxFit.fill),
                              ),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                        color: buttonColor1,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(Icons.keyboard_arrow_down,
                            size: 30, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LandingPage(),
                            ),
                          );
                        }),
                  )
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
