import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose(); // TODO: implement dispose
    super.dispose();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Widget> _pages = [
    AboutUs(),
    SubmitPost(),
  ];
  void _onRefresh() async {
    setState(() {});
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
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
                    child: Text('About Us'),
                    color: buttonColor2,
                    onPressed: () {
                      double height = MediaQuery.of(context).size.height;
                      _controller.animateTo(-height,
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
                      double height = MediaQuery.of(context).size.height;
                      _controller.animateTo(height,
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
                    title: Text('About Us'),
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      _controller.animateTo(-height,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Submit a post'),
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      _controller.animateTo(height,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView(
          controller: _controller,
          shrinkWrap: true,
          children: _pages,
        ),
      ),
    );
  }
}
