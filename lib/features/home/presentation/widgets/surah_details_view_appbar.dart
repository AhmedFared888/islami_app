import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';

class SurahDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SurahDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Al-Fatiha'),
      leading: IconButton(
        color: ColorManager.primaryColor,
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  // SurahDetailsViewAppBar لازم يرث من PreferredSizeWidget
  // لأن Scaffold → appBar بياخد فقط Widgets من النوع ده
  // لازم نحدد له الـ preferredSize علشان يعرف الارتفاع المناسب للـ AppBar
  // kToolbarHeight = 56.0 => هو الارتفاع الافتراضي لأي AppBar في Flutter

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
