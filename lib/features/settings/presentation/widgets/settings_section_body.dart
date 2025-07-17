import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/widgets/custom_divider.dart';
import 'package:islami/features/settings/data/list_tile_model.dart';

class SettingsSectionBody extends StatelessWidget {
  SettingsSectionBody({super.key});

  List<ListTileModel> list = [
    ListTileModel(
      leading: const Icon(Icons.language),
      title: const Text(StringsManager.changeLanguage),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
      routeName: '',
    ),

    ListTileModel(
      leading: const Icon(Icons.logout_outlined),
      title: const Text(StringsManager.logOut),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
      routeName: RoutesManager.loginRoute,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              StringsManager.settings,
              style: StylesManager.textStyle24(ColorManager.primaryColor),
            ),
            const CustomDivider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = list[index];
                  return ListTile(
                    leading: item.leading,
                    title: item.title,
                    titleTextStyle: StylesManager.textStyle14(
                      ColorManager.primaryColor,
                    ),
                    trailing: item.trailing,
                    onTap: () {
                      if (item.routeName == RoutesManager.loginRoute) {
                        GoRouter.of(context).pushReplacement(item.routeName!);
                      }
                    },
                  );
                },
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
