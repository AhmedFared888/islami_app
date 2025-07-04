import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami/constants.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/theme_manager.dart';
import 'package:islami/core/utils/simple_bloc_observer.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(SurahEntityAdapter());
  await Hive.openBox<SurahEntity>(kSurahsBox);
  Hive.registerAdapter(SurahDetailsEntityAdapter());
  await Hive.openBox<SurahDetailsEntity>(kSurahDetailsBox);

  Bloc.observer = SimpleBlocObserver();

  runApp(Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.router,
      theme: getApptheme(),
    );
  }
}
