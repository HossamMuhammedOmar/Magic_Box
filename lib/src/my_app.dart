import 'package:flutter/material.dart';
import 'animation_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Box Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic Box!'),
        ),
        body: AnimationScreen(),
      ),
    );
  }
}
