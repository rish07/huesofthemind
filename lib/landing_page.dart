import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hues/about_us.dart';
import 'package:hues/submit_post.dart';
import 'responsive_widget.dart';
import 'constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  List<Widget> _pages = [
    AboutUs(),
    SubmitPost(),
  ];
  int _selectedIndex = 0;

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
                    child: Text('About Us'),
                    color: buttonColor2,
                    onPressed: () {
                      _controller.animateToPage(0,
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
                      _controller.animateToPage(1,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInCubic);
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
                    title: Text('About Us'),
                    onTap: () {
                      _controller.animateToPage(0,
                          duration: Duration(seconds: 1), curve: Curves.linear);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Submit a post'),
                    onTap: () {
                      _controller.animateToPage(1,
                          duration: Duration(seconds: 1), curve: Curves.linear);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Scrollbar(
        child: PageView(
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: _pages,
          onPageChanged: (int index) {
            _selectedIndex = index;
            _controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
