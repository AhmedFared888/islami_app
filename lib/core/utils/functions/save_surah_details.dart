import 'package:hive/hive.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';

void saveSurahDetails(SurahDetailsEntity details, String boxName) {
  var box = Hive.box<SurahDetailsEntity>(kSurahDetailsBox);
  box.put(details.surahNumber, details);
}
