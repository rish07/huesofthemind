import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:hues/constants.dart';
import 'package:hues/responsive_widget.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:hues/reusable_card.dart';

class PostPage extends StatefulWidget {
  PostPage();
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Widget> _cardsTopLarge = [];
  List<Widget> _cardsBottomLarge = [];
  List<Widget> _cardsTopMedium = [];
  List<Widget> _cardsBottomMedium = [];
  List<Widget> _cardsTopSmall = [];
  List<Widget> _cardsMiddleSmall = [];
  List<Widget> _cardsBottomSmall = [];
  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=IGQVJXbkZADVTd1VERjQUQ5UmRZAeWhLTGt2U1REWWNvUFhVMDlQekwtTjYwUkFtNl8wN1JrOHc3bWlyMTNaenQzSXpsb1RTYXlTMG81SGlNSWZANMEFhMkRvMV81eDE2eEw1cVU3QTNB";
  List posts = [];
  String temp;

  Future fetchPosts(BuildContext context) async {
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
      for (var i = 0; i < 2; i++) {
        _cardsTopSmall.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        _cardsMiddleSmall.add(
          postCard(
              postLink: posts[i + 2]['permalink'],
              caption: posts[i + 2]['caption'],
              imageUrl: posts[i + 2]['media_url']),
        );
        _cardsBottomSmall.add(
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
    fetchPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarBg,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  children: ResponsiveWidget.isLargeScreen(context)
                      ? _cardsTopLarge
                      : ResponsiveWidget.isMediumScreen(context)
                          ? _cardsTopMedium
                          : _cardsTopSmall),
              Row(
                  children: ResponsiveWidget.isLargeScreen(context)
                      ? _cardsBottomLarge
                      : ResponsiveWidget.isMediumScreen(context)
                          ? _cardsBottomMedium
                          : _cardsMiddleSmall),
              ResponsiveWidget.isSmallScreen(context)
                  ? Row(children: _cardsBottomSmall)
                  : Container(
                      height: 0,
                    ),
            ],
          ),
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
                  style: TextStyle(fontSize: 15),
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
                        borderRadius: BorderRadius.circular(8)),
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
