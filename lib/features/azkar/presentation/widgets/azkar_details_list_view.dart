import 'package:flutter/material.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_list_view_item.dart';

class AzkarDetailsListView extends StatelessWidget {
  const AzkarDetailsListView({super.key, required this.azkarList});

  final List<AzkarDetailsEntity> azkarList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return AzkarDetailsListViewItem(azkar: azkarList[index]);
      },
      itemCount: azkarList.length,
    );
  }
}
