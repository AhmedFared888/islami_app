import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ListTileLeading extends StatelessWidget {
  const ListTileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AssetsManager.listTileLeading),
        Text('1', style: StylesManager.textStyle20(ColorManager.white)),
      ],
    );
  }
}

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Surah Name',
          style: StylesManager.textStyle20(ColorManager.white),
        ),
        SizedBox(height: AppSize.s4),
        Text('7 Verses', style: StylesManager.textStyle14(ColorManager.white)),
      ],
    );
  }
}

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'الفاتحة',
      style: StylesManager.textStyle20(ColorManager.white),
    );
  }
}
