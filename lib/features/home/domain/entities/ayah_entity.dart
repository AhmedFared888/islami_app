import 'package:hive/hive.dart';

part 'ayah_entity.g.dart';

@HiveType(typeId: 2)
class AyahEntity {
  @HiveField(0)
  final int ayahNumberInSurah;
  @HiveField(1)
  final String ayahBody;

  AyahEntity({required this.ayahNumberInSurah, required this.ayahBody});
}
