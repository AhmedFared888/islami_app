import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/features/splash/presentation/widgets/sliding_image.dart';

import '../../../../core/resources/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    _navigateToOnboarding();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AssetsManager.onboardingBackground,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Row(children: [Spacer(), Image.asset(AssetsManager.glow)]),
              SizedBox(height: AppSize.s20),
              Image.asset(AssetsManager.logo),
              SlidingImage(slidingAnimation: slidingAnimation),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(RoutesManager.onBoardingRoute);
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
