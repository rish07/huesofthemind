import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/hand_cursor.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/widgets/custom_button.dart';

class AboutEvents extends StatefulWidget {
  @override
  _AboutEventsState createState() => _AboutEventsState();
}

class _AboutEventsState extends State<AboutEvents> {
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
                              color: yellowColor,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: !ResponsiveWidget.isSmallScreen(context)
              ? Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Image.asset('random.gif'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'About the ',
                                      style: TextStyle(
                                        fontSize:
                                            ResponsiveWidget.isLargeScreen(
                                                    context)
                                                ? 24
                                                : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'events',
                                      style: TextStyle(
                                        color: yellowColor,
                                        fontSize:
                                            ResponsiveWidget.isLargeScreen(
                                                    context)
                                                ? 24
                                                : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Vigils persuadere! Large, aged pudding is best rinsed with mild beer.Ahoy, oh.Huge, brave girls rudely fight a distant, calm cosmonaut.Real visions lead to the disconnection.The queen is always final.Why does the admiral walk?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            ResponsiveWidget.isLargeScreen(
                                                    context)
                                                ? 24
                                                : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Vigils persuadere! Large, aged pudding is best rinsed with mild beer.Ahoy, oh.Huge, brave girls rudely fight a distant, calm cosmonaut.Real visions lead to the disconnection.The queen is always final.Why does the admiral walk?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            ResponsiveWidget.isLargeScreen(
                                                    context)
                                                ? 24
                                                : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customButton(
                                        title: 'Volunteer', onPressed: () {}),
                                    SizedBox(
                                      width: ResponsiveWidget.isLargeScreen(
                                              context)
                                          ? 30
                                          : 10,
                                    ),
                                    customButton(
                                      title: 'Collaborate',
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RaisedButton(
                            color: Colors.white,
                            hoverColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                              color: yellowColor,
                              width: 3,
                            )),
                            padding: EdgeInsets.all(
                              ResponsiveWidget.isLargeScreen(context) ? 8 : 4,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Go back',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset('random.gif'),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'About the ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'events',
                                  style: TextStyle(
                                    color: yellowColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Vigils persuadere! Large, aged pudding is best rinsed with mild beer.Ahoy, oh.Huge, brave girls rudely fight a distant, calm cosmonaut.Real visions lead to the disconnection.The queen is always final.Why does the admiral walk?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Vigils persuadere! Large, aged pudding is best rinsed with mild beer.Ahoy, oh.Huge, brave girls rudely fight a distant, calm cosmonaut.Real visions lead to the disconnection.The queen is always final.Why does the admiral walk?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customButton(
                                    title: 'Volunteer', onPressed: () {}),
                                SizedBox(
                                  width: ResponsiveWidget.isLargeScreen(context)
                                      ? 30
                                      : 10,
                                ),
                                customButton(
                                  title: 'Collaborate',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
