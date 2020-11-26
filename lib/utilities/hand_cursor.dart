import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HandCursor extends Listener {
  static final appContainer =
      html.window.document.getElementById('app-container');
  HandCursor({Widget child})
      : super(
            onPointerHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'pointer';
            },
            onPointerCancel: (PointerCancelEvent evt) {
              appContainer.style.cursor = 'default';
            },
            child: child);
}
