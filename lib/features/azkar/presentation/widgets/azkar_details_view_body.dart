import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_divider.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_view_appbar.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: const AzkarDetailsViewAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsManager.leftCorner),
                const Spacer(),
                Text(
                  'اذكار الصباح',
                  style: StylesManager.textStyle24(ColorManager.primaryColor),
                ),
                const Spacer(),
                Image.asset(AssetsManager.rightCorner),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            Text(
              'اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ',
              style: StylesManager.textStyle24(ColorManager.primaryColor),
              textAlign: TextAlign.right,
            ),
            const CustomDivider(),
            Text(
              'التكرار : 1',
              style: StylesManager.textStyle20(ColorManager.primaryColor),
            ),
            const SizedBox(height: AppSize.s18),
            Text(
              'من قالها موقنا بها حين يمسى ومات من ليلته دخل الجنة وكذلك حين يصبح',
              style: StylesManager.textStyle20(ColorManager.lightGrey),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
