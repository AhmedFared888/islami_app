import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/presentation/widgets/home_list_view_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key, required this.surahs});

  final List<SurahEntity> surahs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              RoutesManager.surahDetailsRoute,
              extra: surahs[index].numberOfSurah,
            );
          },
          child: HomeListViewItem(surah: surahs[index]),
        );
      },
      itemCount: surahs.length,
    );
  }
}
