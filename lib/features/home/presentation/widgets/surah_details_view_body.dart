import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/features/home/domain/entities/ayah_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/presentation/manager/fetch_surah_details_cubit/fetch_surah_details_cubit.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_list_view_item.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_view_appbar.dart';

class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key, required this.surahEntity});

  final SurahEntity surahEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: SurahDetailsViewAppBar(surahtitle: surahEntity.enName),
      body: BlocBuilder<FetchSurahDetailsCubit, FetchSurahDetailsState>(
        builder: (context, state) {
          if (state is FetchSurahDetailsSuccess) {
            List<AyahEntity> ayahs = state.surahDetails.ayahs;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      const Spacer(),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              surahEntity.arName,
                              style: StylesManager.textStyle24(
                                ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  const SizedBox(height: AppSize.s30),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SurahDetailsListViewItem(
                          ayah:
                              '[${ayahs[index].ayahNumberInSurah}] ${ayahs[index].ayahBody}',
                        );
                      },
                      itemCount: ayahs.length,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FetchSurahDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
