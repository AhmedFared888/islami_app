import 'package:flutter/material.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/presentation/widgets/home_list_tile_componants.dart';

import '../../../../core/resources/values_manager.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({super.key, required this.surah});

  final SurahEntity surah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ListTileLeading(number: surah.numberOfSurah),
          title: ListTileTitle(
            name: surah.enName,
            versesCount: surah.versesNumber,
          ),
          trailing: ListTileTrailing(arabicName: surah.arName),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Divider(),
        ),
      ],
    );
  }
}
