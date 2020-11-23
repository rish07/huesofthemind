import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hues/screens/about_us.dart';
import 'package:hues/screens/post_page.dart';
import 'package:hues/screens/submit_post.dart';
import 'package:hues/utilities/hand_cursor.dart';
import 'package:hues/widgets/postCard.dart';

import '../utilities/constants.dart';
import '../utilities/responsive_widget.dart';
import 'post_page.dart';

class LandingPage extends StatefulWidget {
  final List<Widget> posts;

  const LandingPage({Key key, this.posts}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _activeTab = 1;
  var controller = PageController();
  int currentPage = 0;
  List<Widget> _pages = [
    PostPage(),
    AboutUs(),
    SubmitPost(),
  ];

  String temp;
  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=IGQVJWZAmRLYmNhRnc3YUFRQy1RM3JNaGdqbTQ2aHY4Q2lJdmhvS3FCbWpjNGprLVJ3a1BiODhpU2t3QzlLVkNmREM3N2JqMTdod1BfZAmc5VnRNZA2VuUUl1S3RvMEZABR2t2Rkotd0p3";

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
      for (var i = 0; i < 5; i++) {
        cardsTopLarge.add(
          postCard(
              context: context,
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        cardsBottomLarge.add(
          postCard(
              context: context,
              postLink: posts[i + 5]['permalink'],
              caption: posts[i + 5]['caption'],
              imageUrl: posts[i + 5]['media_url']),
        );
      }
      for (var i = 0; i < 3; i++) {
        cardsTopMedium.add(
          postCard(
              context: context,
              postLink: posts[i]['permalink'],
              caption: posts[i]['caption'],
              imageUrl: posts[i]['media_url']),
        );
        cardsBottomMedium.add(
          postCard(
              context: context,
              postLink: posts[i + 3]['permalink'],
              caption: posts[i + 3]['caption'],
              imageUrl: posts[i + 3]['media_url']),
        );
      }
      setState(() {
        loading = false;
      });
    });

    return posts;
  }

  @override
  void initState() {
    fetchPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              title: Text(
                'huesofthemind ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caveat'),
              ),
              leading: CircleAvatar(
                child: Image.asset('logo.png'),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: HandCursor(
                    child: FlatButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Recent Events',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 50
                                : 30,
                            child: Divider(
                              thickness: ResponsiveWidget.isLargeScreen(context)
                                  ? 3
                                  : 2,
                              color: _activeTab == 1
                                  ? yellowColor
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _activeTab = 1;
                        });
                        controller.animateToPage(0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: HandCursor(
                    child: FlatButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Stories',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 50
                                : 30,
                            child: Divider(
                              thickness: ResponsiveWidget.isLargeScreen(context)
                                  ? 3
                                  : 2,
                              color: _activeTab == 2
                                  ? yellowColor
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _activeTab = 2;
                        });
                        controller.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: HandCursor(
                    child: FlatButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 50
                                : 30,
                            child: Divider(
                              thickness: ResponsiveWidget.isLargeScreen(context)
                                  ? 3
                                  : 2,
                              color: _activeTab == 3
                                  ? yellowColor
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _activeTab = 3;
                        });
                        controller.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8,
                    left: 16,
                    right: 32,
                  ),
                  child: HandCursor(
                    child: FlatButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 50
                                : 30,
                            child: Divider(
                              thickness: ResponsiveWidget.isLargeScreen(context)
                                  ? 3
                                  : 2,
                              color: _activeTab == 4
                                  ? yellowColor
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _activeTab = 4;
                        });
                        controller.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                ),
              ],
            )
          : AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Image.asset(
                    'logo.png',
                    fit: BoxFit.contain,
                    scale: 8,
                  ),
                  Text(
                    'huesofthemind ',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Caveat',
                    ),
                  ),
                ],
              ),
              backgroundColor: appBarBg,
              actions: <Widget>[Padding(padding: EdgeInsets.all(8))],
            ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: null,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      backgroundBlendMode: BlendMode.dstATop,
                      image: DecorationImage(
                        image: AssetImage('drawer.jpg'),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                  ),
                  ListTile(
                    title: Text('Recent Posts'),
                    onTap: () {
                      controller.animateToPage(0,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('About Us'),
                    onTap: () {
                      controller.animateToPage(1,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Submit a post'),
                    onTap: () {
                      print('working');

                      controller.animateToPage(2,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: PageView(
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        controller: controller,
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        children: _pages,
      ),
      floatingActionButton:
          (ResponsiveWidget.isSmallScreen(context) && (currentPage == 0))
              ? Padding(
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
                        controller.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      }),
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
