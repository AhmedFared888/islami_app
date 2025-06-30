import 'package:hive/hive.dart';

part 'surah_entity.g.dart';

@HiveType(typeId: 0)
class SurahEntity {
  @HiveField(0)
  final int numberOfSurah;
  @HiveField(1)
  final String enName;
  @HiveField(2)
  final int versesNumber;
  @HiveField(3)
  final String arName;
  SurahEntity({
    required this.numberOfSurah,
    required this.enName,
    required this.versesNumber,
    required this.arName,
  });
}
