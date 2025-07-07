import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/features/home/presentation/manager/fetch_surahs_cubit/fetch_surahs_cubit.dart';
import 'package:islami/features/home/presentation/widgets/home_list_view.dart';

class HomeListViewBlocBuilder extends StatelessWidget {
  const HomeListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSurahsCubit, FetchSurahsState>(
      builder: (context, state) {
        if (state is FetchSurahsSuccess) {
          return HomeListView(surahs: state.surahs);
        } else if (state is FetchSurahsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
