import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_list_view.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_view_appbar.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: const AzkarDetailsViewAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsManager.leftCorner),
                const Spacer(),
                Text(
                  'اذكار الصباح',
                  style: StylesManager.textStyle24(ColorManager.primaryColor),
                ),
                const Spacer(),
                Image.asset(AssetsManager.rightCorner),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            const Expanded(child: AzkarDetailsListView()),
          ],
        ),
      ),
    );
  }
}
