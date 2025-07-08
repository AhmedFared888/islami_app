import 'package:hive/hive.dart';

part 'azkar_details_entity.g.dart';

@HiveType(typeId: 3)
class AzkarDetailsEntity {
  @HiveField(0)
  final String categoryItem;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final int numberOfRepetitions;
  @HiveField(3)
  final String descriptionOfzekr;

  AzkarDetailsEntity({
    required this.categoryItem,
    required this.body,
    required this.numberOfRepetitions,
    required this.descriptionOfzekr,
  });
}
