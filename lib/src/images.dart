import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final randomNumber;
  Images(this.randomNumber);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/src/images/$randomNumber.png',
      width: 200.0,
      height: 200.0,
    );
  }
}
