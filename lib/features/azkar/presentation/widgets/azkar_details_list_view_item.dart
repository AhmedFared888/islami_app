import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_divider.dart';

class AzkarDetailsListViewItem extends StatelessWidget {
  const AzkarDetailsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ',
          style: StylesManager.textStyle24(ColorManager.primaryColor),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          'التكرار : 1',
          style: StylesManager.textStyle20(ColorManager.primaryColor),
        ),
        const SizedBox(height: AppSize.s4),
        Text(
          'من قالها موقنا بها حين يمسى ومات من ليلته دخل الجنة وكذلك حين يصبح',
          style: StylesManager.textStyle20(ColorManager.lightGrey),
          textAlign: TextAlign.right,
        ),
        const CustomDivider(),
        const SizedBox(height: AppSize.s14),
      ],
    );
  }
}
