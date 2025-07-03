import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ListTileLeading extends StatelessWidget {
  const ListTileLeading({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AssetsManager.listTileLeading),
        Text(
          number.toString(),
          style: StylesManager.textStyle14(ColorManager.white),
        ),
      ],
    );
  }
}

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({
    super.key,
    required this.name,
    required this.versesCount,
  });

  final String name;
  final int versesCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: StylesManager.textStyle20(ColorManager.white)),
        SizedBox(height: AppSize.s4),
        Text(
          '$versesCount Verses',
          style: StylesManager.textStyle14(ColorManager.white),
        ),
      ],
    );
  }
}

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing({super.key, required this.arabicName});

  final String arabicName;
  @override
  Widget build(BuildContext context) {
    return Text(
      arabicName,
      style: StylesManager.textStyle20(ColorManager.white),
    );
  }
}
