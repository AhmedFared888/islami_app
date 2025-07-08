import 'package:hive/hive.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

void saveAzkarData(List<AzkarDetailsEntity> azkar, String boxName) {
  var box = Hive.box<AzkarDetailsEntity>(boxName);
  for (var item in azkar) {
    box.put(item.categoryItem, item); // استخدم categoryItem كمفتاح
  }
}
