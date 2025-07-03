import 'package:islami/features/home/domain/entities/ayah_entity.dart';

class SurahDetailsEntity {
  final String surahTitle;
  final List<AyahEntity> ayahs;

  SurahDetailsEntity({required this.surahTitle, required this.ayahs});
}
