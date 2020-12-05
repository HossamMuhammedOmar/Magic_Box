import 'dart:math';

import 'package:Magic_Box/src/images.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationScreenState();
}

class AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  Animation magicAnimation;
  AnimationController magicController;
  int imageNumber = 1;

  @override
  void initState() {
    super.initState();
    magicController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    magicAnimation = Tween(begin: 0.0, end: 170.0).animate(
      CurvedAnimation(
        parent: magicController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            buildAnimation(),
            Container(
              width: 200.0,
              height: 200.0,
              color: Color(0xff000000),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  // Helper Method for Animation
  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: magicAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: magicAnimation.value,
          left: 0,
          right: 0,
          child: child,
        );
      },
      child: Images(imageNumber),
    );
  }

  void onTap() {
    if (magicAnimation.status == AnimationStatus.completed) {
      magicController.reverse();
    } else if (magicAnimation.status == AnimationStatus.dismissed) {
      magicController.forward();
      setState(() {
        imageNumber = Random().nextInt(2) + 1;
      });
    }
  }
}
