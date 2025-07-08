import 'package:flutter/material.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_list_view_item.dart';

class AzkarDetailsListView extends StatelessWidget {
  const AzkarDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return const AzkarDetailsListViewItem();
      },
      itemCount: 10,
    );
  }
}
