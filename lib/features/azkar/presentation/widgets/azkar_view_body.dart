import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_list_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AssetsManager.homeBackground, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Center(child: Image.asset(AssetsManager.homeLogo)),
                Center(child: Image.asset(AssetsManager.doaa)),
                Expanded(child: AzkarListView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
