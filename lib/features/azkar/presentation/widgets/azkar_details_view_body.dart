import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_view_appbar.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: AzkarDetailsViewAppbar(),
    );
  }
}
