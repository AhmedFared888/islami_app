import 'package:hive/hive.dart';
import 'package:islami/features/home/domain/entities/ayah_entity.dart';

part 'surah_details_entity.g.dart';

@HiveType(typeId: 1)
class SurahDetailsEntity {
  @HiveField(0)
  final String surahTitle;
  @HiveField(1)
  final List<AyahEntity> ayahs;
  @HiveField(2)
  final int surahNumber;

  SurahDetailsEntity({
    required this.surahTitle,
    required this.ayahs,
    required this.surahNumber,
  });
}
