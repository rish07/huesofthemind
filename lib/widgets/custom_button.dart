import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/hand_cursor.dart';

Flexible customButton({String title, Function onPressed}) {
  return Flexible(
    child: HandCursor(
      child: MaterialButton(
        padding: EdgeInsets.all(12),
        minWidth: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        color: yellowColor,
        onPressed: onPressed,
      ),
    ),
  );
}
