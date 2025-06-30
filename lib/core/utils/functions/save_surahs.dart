import 'package:hive/hive.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

void saveSurahsData(List<SurahEntity> surahs, String boxName) {
  var box = Hive.box<SurahEntity>(boxName);
  box.addAll(surahs);
}
