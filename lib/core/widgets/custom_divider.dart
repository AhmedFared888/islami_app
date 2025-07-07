import 'package:flutter/material.dart';
import 'package:islami/core/resources/values_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p40,
        vertical: AppPadding.p8,
      ),
      child: Divider(),
    );
  }
}
