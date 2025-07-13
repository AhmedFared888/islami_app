import 'package:hive/hive.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

abstract class AzkarDetailsLocalDataSource {
  List<AzkarDetailsEntity>? fetchAzkarDetails({required String category});
}

class AzkarDetailsLocalDataSourceImpl extends AzkarDetailsLocalDataSource {
  @override
  List<AzkarDetailsEntity>? fetchAzkarDetails({required String category}) {
    final box = Hive.box(kAzkarBox);

    final dynamic raw = box.get(category);

    if (raw == null || raw is! List) return null;

    // فلترة العناصر من النوع الصح
    return raw.whereType<AzkarDetailsEntity>().toList();
  }
}
