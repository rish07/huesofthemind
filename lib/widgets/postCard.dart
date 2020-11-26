import 'package:flutter/material.dart';
import 'package:hues/utilities/reusable_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/hand_cursor.dart';
import 'dart:html' as html;

Expanded postCard({String caption, String imageUrl, String postLink, BuildContext context}) {
  return Expanded(
    child: ReusableCard(
      colour: Colors.white,
      cardChild: Container(
        height: 420,
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
              padding: const EdgeInsets.all(8),
              child: HandCursor(
                child: MaterialButton(
                    elevation: 10,
                    child: AutoSizeText(
                      'Read more',
                      maxLines: 1,
                    ),
                    color: appBarBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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
