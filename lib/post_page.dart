import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:hues/constants.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:hues/reusable_card.dart';

class PostPage extends StatefulWidget {
  PostPage();
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Widget> _cardsTop = [];
  List<Widget> _cardsBottom = [];
  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=${DotEnv().env['ACCESS_TOKEN']}";
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
        _cardsTop.add(
          postCard(
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        _cardsBottom.add(
          postCard(
              postLink: posts[i + 6]['permalink'],
              caption: posts[i + 6]['caption'],
              imageUrl: posts[i + 6]['media_url']),
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
  Widget build(BuildContext context) {
    return Container(
      color: appBarBg,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(children: _cardsTop),
            ),
            Expanded(
              child: Row(children: _cardsBottom),
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
        cardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
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
    );
  }
}
