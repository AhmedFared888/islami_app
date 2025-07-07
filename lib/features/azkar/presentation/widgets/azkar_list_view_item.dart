import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/features/azkar/data/models/azkar_list_item_model.dart';

class AzkarListViewItem extends StatelessWidget {
  const AzkarListViewItem({super.key, required this.azkarListItemModel});

  final AzkarListItemModel azkarListItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Text(
            azkarListItemModel.title,
            style: StylesManager.textStyle24(ColorManager.white),
          ),
          onTap: () {
            GoRouter.of(context).push(
              RoutesManager.azkarDetailsRoute,
              extra: azkarListItemModel.title,
            );
          },
        ),
        azkarListItemModel.customDivider,
      ],
    );
  }
}
