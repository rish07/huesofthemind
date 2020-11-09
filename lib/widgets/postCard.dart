import 'package:flutter/material.dart';
import 'package:hues/utilities/reusable_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/hand_cursor.dart';
import 'dart:html' as html;

Expanded postCard({String caption, String imageUrl, String postLink, BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Expanded(
    child: ReusableCard(
      colour: Colors.white,
      cardChild: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        height: 425,
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                caption,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 6,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ResponsiveWidget.isMediumScreen(context) ? size.width * 0.17 : size.width * 0.3, right: 10, top: 5),
              child: HandCursor(
                child: OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    child: AutoSizeText(
                      'Read more',
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      html.window.open(postLink, 'Post Link');
                    }),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
