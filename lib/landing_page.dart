import 'package:hues/post_page.dart';

import 'package:flutter/material.dart';
import 'package:hues/about_us.dart';
import 'package:hues/submit_post.dart';
import 'responsive_widget.dart';
import 'constants.dart';
import 'post_page.dart';

class LandingPage extends StatefulWidget {
  final List posts;

  const LandingPage({Key key, this.posts}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var controller = PageController();
  int currentPage = 0;
  List<Widget> _pages = [
    PostPage(),
    AboutUs(),
    SubmitPost(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              leading: Image.asset('logo.png'),
              elevation: 0,
              backgroundColor: appBarBg,
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Recent posts'),
                    color: buttonColor2,
                    onPressed: () {
                      controller.animateToPage(0,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('About Us'),
                    color: buttonColor2,
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Submit a post!'),
                    color: buttonColor1,
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
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
