import 'dart:html' as html;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hues/utilities/hand_cursor.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/utilities/reusable_card.dart';

Expanded postCard(
    {String caption, String imageUrl, String postLink, BuildContext context}) {
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
        height: 402,
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
                textAlign: TextAlign.justify,
                maxLines: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HandCursor(
                    child: RaisedButton(
                        color: Colors.white,
                        hoverColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            'Read more',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          html.window.open(postLink, 'Post Link');
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
