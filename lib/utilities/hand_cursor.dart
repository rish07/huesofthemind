import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'dart:html' as html;

class HandCursor extends Listener {
  static final appContainer =
      html.window.document.getElementById('app-container');
  HandCursor({Widget child})
      : super(
            onPointerHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'pointer';
            },

            child: child);
}
