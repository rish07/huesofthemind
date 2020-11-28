import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hues/screens/about_us.dart';
import 'package:hues/screens/contact_us.dart';
import 'package:hues/screens/outreach.dart';
import 'package:hues/screens/post_page.dart';
import 'package:hues/screens/recent_events.dart';
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
    RecentEvents(),
    PostPage(),
    AboutUs(),
    //SubmitPost(),
    Outreach(),
    ContactUs(),
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
              leading: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('logo.png'),
                  backgroundColor: Colors.transparent,
                ),
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
                        controller.animateToPage(2,
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
                        controller.animateToPage(5,
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
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.1,
                  // ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'logo.png',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'huesofthemind ',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Caveat',
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              actions: <Widget>[Padding(padding: EdgeInsets.all(8))],
            ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              child: Container(
                color: yellowColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'logo.png',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'huesofthemind',
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          indent: 120,
                          endIndent: 120,
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            DrawerOption(
                              controller: controller,
                              pageNumber: 0,
                              title: 'Recent Events',
                            ),
                            DrawerOption(
                              controller: controller,
                              pageNumber: 1,
                              title: 'Stories',
                            ),
                            DrawerOption(
                              controller: controller,
                              pageNumber: 2,
                              title: 'About us',
                            ),
                            DrawerOption(
                              controller: controller,
                              pageNumber: 5,
                              title: 'Contact Us',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Divider(
                          indent: 120,
                          endIndent: 120,
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            html.window.open(
                                'https://www.instagram.com/huesofthemind/',
                                'Post Link');
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 20,
                            width: 20,
                            child: Image.asset('insta.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            html.window.open(
                                'https://twitter.com/huesofthemind',
                                'Post Link');
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 20,
                            width: 20,
                            child: Image.asset('twitter.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            html.window.open(
                                'mailto:huesofthemind@gmail.com', 'Post Link');
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 30,
                            width: 30,
                            child: Icon(Icons.email),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
          (ResponsiveWidget.isSmallScreen(context) && (currentPage == 1))
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
                        controller.animateToPage(2,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      }),
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DrawerOption extends StatelessWidget {
  const DrawerOption({
    Key key,
    @required this.controller,
    this.title,
    this.pageNumber,
  }) : super(key: key);

  final PageController controller;
  final String title;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(pageNumber,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 15,
        ),
        child: Container(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: pageNumber == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
