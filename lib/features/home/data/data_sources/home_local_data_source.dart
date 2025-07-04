import 'package:hive_flutter/hive_flutter.dart';
import 'package:islami/constants.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeLocalDataSource {
  List<SurahEntity> fetchSurahs();
  SurahDetailsEntity? fetchSurahDetails(int surahNumber);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<SurahEntity> fetchSurahs() {
    var box = Hive.box<SurahEntity>(kSurahsBox);

    print(box);
    return box.values.toList();
  }

  @override
  SurahDetailsEntity? fetchSurahDetails(int surahNumber) {
    var box = Hive.box<SurahDetailsEntity>(kSurahDetailsBox);
    print(box);
    return box.get(surahNumber);
  }
}
