import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class SurahDetailsListViewItem extends StatelessWidget {
  const SurahDetailsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s14),
          border: Border.all(
            color: ColorManager.primaryColor,
            width: AppSize.s1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p10,
            horizontal: AppPadding.p8,
          ),
          child: Center(
            child: Text(
              '[1] بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
              textAlign: TextAlign.right,
              style: StylesManager.textStyle20(ColorManager.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
