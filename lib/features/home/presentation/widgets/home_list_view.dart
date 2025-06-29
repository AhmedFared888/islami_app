import 'package:flutter/material.dart';
import 'package:islami/features/home/presentation/widgets/home_list_view_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return HomeListViewItem();
      },
      itemCount: 10,
    );
  }
}
