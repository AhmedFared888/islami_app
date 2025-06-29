import 'package:flutter/material.dart';
import 'package:islami/features/home/presentation/widgets/home_list_tile_componants.dart';

import '../../../../core/resources/values_manager.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ListTileLeading(),
          title: ListTileTitle(),
          trailing: ListTileTrailing(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Divider(),
        ),
      ],
    );
  }
}
