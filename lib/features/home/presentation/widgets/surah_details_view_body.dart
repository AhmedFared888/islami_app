import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_list_view_item.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_view_appbar.dart';

class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: SurahDetailsViewAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AssetsManager.leftCorner),
                Spacer(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الفاتحه',
                        style: StylesManager.textStyle24(
                          ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(AssetsManager.rightCorner),
              ],
            ),
            SizedBox(height: AppSize.s30),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SurahDetailsListViewItem();
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
