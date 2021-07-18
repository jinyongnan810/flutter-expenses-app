import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AdaptiveTextButton extends StatelessWidget {
  final _text;
  final _onPressed;
  AdaptiveTextButton(this._text, this._onPressed);
  @override
  Widget build(BuildContext context) {
    final isIOS = true; //defaultTargetPlatform == TargetPlatform.iOS;
    return isIOS
        // ios button changes opacity when clicked
        ? CupertinoButton(onPressed: this._onPressed, child: Text(this._text))
        : TextButton(onPressed: this._onPressed, child: Text(this._text));
  }
}
