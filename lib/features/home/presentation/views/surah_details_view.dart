import 'package:flutter/material.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/presentation/widgets/surah_details_view_body.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key, required this.surahEntity});

  final SurahEntity surahEntity;

  @override
  Widget build(BuildContext context) {
    return SurahDetailsViewBody(surahEntity: surahEntity);
  }
}
