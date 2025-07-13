import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/features/azkar/presentation/manager/cubit/fetch_azkar_cubit.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_list_view.dart';

class AzkarDetailsListViewBlocBuilder extends StatelessWidget {
  const AzkarDetailsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAzkarCubit, FetchAzkarState>(
      builder: (context, state) {
        if (state is FetchAzkarSuccess) {
          return AzkarDetailsListView(azkarList: state.azkar);
        } else if (state is FetchAzkarFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: StylesManager.textStyle20(ColorManager.primaryColor),
            ),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
