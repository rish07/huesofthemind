import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/responsive_widget.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 26,
                  width: 20,
                  child: VerticalDivider(
                    width: 2,
                    thickness: 4,
                    color: yellowColor,
                  ),
                ),
                Text(
                  'Contact ',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Us',
                  style: TextStyle(
                    color: yellowColor,
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://www.instagram.com/huesofthemind/',
                          'Post Link');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'insta.png',
                              scale: ResponsiveWidget.isMediumScreen(context)
                                  ? 5
                                  : 3,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '@huesofthemind',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://twitter.com/huesofthemind', 'Post Link');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'twitter.png',
                              scale: ResponsiveWidget.isMediumScreen(context)
                                  ? 8
                                  : 5,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Twitter',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      html.window
                          .open('mailto:huesofthemind@gmail.com', 'Post Link');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Icon(
                              Icons.email,
                              size: ResponsiveWidget.isMediumScreen(context)
                                  ? 70
                                  : 120,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'huesofthemind@gmail.com',
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 22
                                  : 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
