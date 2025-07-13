import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/features/azkar/presentation/manager/cubit/fetch_azkar_cubit.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_list_view_bloc_builder.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_view_appbar.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({
    super.key,
    required this.category,
    required this.title,
  });

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: const AzkarDetailsViewAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: BlocBuilder<FetchAzkarCubit, FetchAzkarState>(
          builder: (context, state) {
            if (state is FetchAzkarSuccess) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      const SizedBox(width: AppSize.s8),
                      Expanded(
                        child: Text(
                          title,
                          style: StylesManager.textStyle24(
                            ColorManager.primaryColor,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          maxLines: null,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: AppSize.s8),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  const SizedBox(height: AppSize.s16),
                  const Expanded(child: AzkarDetailsListViewBlocBuilder()),
                ],
              );
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
        ),
      ),
    );
  }
}
