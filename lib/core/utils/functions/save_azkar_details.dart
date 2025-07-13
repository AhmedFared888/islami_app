import 'package:hive/hive.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

void saveAzkarData(
  List<AzkarDetailsEntity> azkar,
  String category,
  String boxName,
) {
  final box = Hive.box(boxName);

  box.put(category, azkar); // استخدم categoryItem كمفتاح
}
