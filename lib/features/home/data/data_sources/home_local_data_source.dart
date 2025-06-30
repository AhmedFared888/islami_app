import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeLocalDataSource {
  SurahEntity fetchSurahs();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  SurahEntity fetchSurahs() {
    // TODO: implement fetchSurahs
    throw UnimplementedError();
  }
}
