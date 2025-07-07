import 'package:flutter/material.dart';
import 'package:islami/features/azkar/presentation/widgets/azkar_details_view_body.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return const AzkarDetailsViewBody();
  }
}
