import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String data;
  Question(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.right,
    );
  }
}
