import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resultWidget = true ? Text("Result: " + (true ? "OK" : "WRONG"))
        : Text("");
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: resultWidget,
    );
  }
}
