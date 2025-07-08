import 'package:hive/hive.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

abstract class AzkarDetailsLocalDataSource {
  List<AzkarDetailsEntity>? fetchAzkarDetails({required String category});
}

class AzkarDetailsLocalDataSourceImpl extends AzkarDetailsLocalDataSource {
  @override
  List<AzkarDetailsEntity>? fetchAzkarDetails({required String category}) {
    var box = Hive.box<List<AzkarDetailsEntity>>(kAzkarBox);
    print(box);
    return box.get(category);
  }
}
