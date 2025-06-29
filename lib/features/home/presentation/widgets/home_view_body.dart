import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/features/home/presentation/widgets/home_list_view.dart';

import '../../../../core/resources/color_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AssetsManager.homeBackground, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Center(child: Image.asset(AssetsManager.homeLogo)),
                Center(
                  child: Container(
                    width: AppSize.s100,
                    height: AppSize.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(AppSize.s18),
                    ),
                    child: Image.asset(
                      AssetsManager.quran,
                      height: AppSize.s100,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s10),
                Expanded(child: HomeListView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
