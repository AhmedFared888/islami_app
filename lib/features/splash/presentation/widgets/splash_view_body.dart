import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/routes_manager.dart';

import '../../../../core/resources/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(AssetsManager.splashBackground, fit: BoxFit.cover),
      ),
    );
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(RoutesManager.onBoardingRoute);
    });
  }
}
