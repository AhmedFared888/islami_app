import 'package:hive/hive.dart';

part 'azkar_details_entity.g.dart';

@HiveType(typeId: 3)
class AzkarDetailsEntity {
  @HiveField(0)
  final int zekrId;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final int countOfZekr;

  AzkarDetailsEntity({
    required this.zekrId,
    required this.body,
    required this.countOfZekr,
  });
}
