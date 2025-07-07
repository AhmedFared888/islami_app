import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';

class AzkarDetailsViewAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AzkarDetailsViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'اذكار الصباح',
        style: StylesManager.textStyle24(ColorManager.primaryColor),
      ),
      leading: IconButton(
        color: ColorManager.primaryColor,
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
