import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/features/home/presentation/manager/fetch_surah_details_cubit/fetch_surah_details_cubit.dart';

class SurahDetailsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SurahDetailsViewAppBar({super.key, required this.surahtitle});

  final String surahtitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSurahDetailsCubit, FetchSurahDetailsState>(
      builder: (context, state) {
        if (state is FetchSurahDetailsSuccess) {
          return AppBar(
            title: Text(state.surahDetails.surahTitle),
            leading: IconButton(
              color: ColorManager.primaryColor,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          );
        } else if (state is FetchSurahDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  // SurahDetailsViewAppBar لازم يرث من PreferredSizeWidget
  // لأن Scaffold → appBar بياخد فقط Widgets من النوع ده
  // لازم نحدد له الـ preferredSize علشان يعرف الارتفاع المناسب للـ AppBar
  // kToolbarHeight = 56.0 => هو الارتفاع الافتراضي لأي AppBar في Flutter

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
