import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';

import '../../data/onboarding_data.dart';

class OnboardingViewBody extends StatefulWidget {
  OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentIndex = 0;

  void _goNext() {
    if (currentIndex < onboardingData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      GoRouter.of(context).pushReplacement(RoutesManager.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = onboardingData[currentIndex];
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AssetsManager.onboardingBackground,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p200,
                right: AppPadding.p14,
                left: AppPadding.p14,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.title,
                      style: StylesManager.textStyle24(
                        ColorManager.primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s20),
                    Text(
                      model.subTitle,
                      textAlign: TextAlign.center,
                      style: StylesManager.textStyle14(ColorManager.lightGrey),
                    ),
                    SizedBox(height: AppSize.s20),
                    Container(
                      width: AppSize.s200,
                      height: AppSize.s200,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(AppSize.s18),
                      ),
                      child: Image.asset(
                        model.image,
                        height: AppSize.s250,
                        color: ColorManager.black,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: AppPadding.p10),
                          child: TextButton(
                            onPressed: _goNext,
                            child: Text(
                              'Next',
                              style: StylesManager.textStyle24(
                                ColorManager.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
