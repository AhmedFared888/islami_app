import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(AssetsManager.islami),
        );
      },
    );
  }
}
