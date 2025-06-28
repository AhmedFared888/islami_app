import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/values_manager.dart';

class LogoObject extends StatelessWidget {
  const LogoObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsManager.logo, width: AppSize.s100),
        Image.asset(AssetsManager.islami, width: AppSize.s100),
      ],
    );
  }
}
