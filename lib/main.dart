import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami/constants.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/theme_manager.dart';
import 'package:islami/core/utils/functions/service_locator.dart';
import 'package:islami/core/utils/simple_bloc_observer.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';
import 'package:islami/features/home/domain/entities/ayah_entity.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SurahEntityAdapter()); // typeId = 0
  Hive.registerAdapter(SurahDetailsEntityAdapter()); // typeId = 1
  Hive.registerAdapter(AyahEntityAdapter()); // typeId = 2
  Hive.registerAdapter(AzkarDetailsEntityAdapter()); // typeId = 3

  await Hive.openBox<SurahEntity>(kSurahsBox);
  await Hive.openBox<SurahDetailsEntity>(kSurahDetailsBox);
  await Hive.openBox<AyahEntity>(kAyahBox);
  await Hive.openBox(kAzkarBox);

  setupServiceLocator();

  Bloc.observer = SimpleBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      saveLocale: false,
      child: Builder(
        builder: (context) {
          return const Islami();
        },
      ),
    ),
  );
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.router,
      theme: getApptheme(),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
