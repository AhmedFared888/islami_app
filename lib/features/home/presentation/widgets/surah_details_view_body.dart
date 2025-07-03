import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_view_appbar.dart';

class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: SurahDetailsViewAppBar(),
      body: Column(children: [Row(children: [
              
            ],
          )]),
    );
  }
}
