import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_divider.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

class AzkarDetailsListViewItem extends StatelessWidget {
  const AzkarDetailsListViewItem({super.key, required this.azkar});

  final AzkarDetailsEntity azkar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          azkar.body,
          style: StylesManager.textStyle24(ColorManager.primaryColor),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          'التكرار : ${azkar.countOfZekr}',
          style: StylesManager.textStyle20(ColorManager.white),
        ),
        const SizedBox(height: AppSize.s4),
        // Text(
        //   azkar.,
        //   style: StylesManager.textStyle20(ColorManager.lightGrey),
        //   textAlign: TextAlign.right,
        // ),
        const CustomDivider(),
        const SizedBox(height: AppSize.s14),
      ],
    );
  }
}
