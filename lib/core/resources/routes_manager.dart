import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/home/data/data_sources/home_local_data_source.dart';
import 'package:islami/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islami/features/home/data/repos/home_repo_impl.dart';
import 'package:islami/features/home/domain/usecases/home_use_case.dart';
import 'package:islami/features/home/domain/usecases/surah_details_use_case.dart';
import 'package:islami/features/home/presentation/manager/fetch_surah_details_cubit/fetch_surah_details_cubit.dart';
import 'package:islami/features/home/presentation/manager/fetch_surahs_cubit/fetch_surahs_cubit.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/home/presentation/views/surah_details_view.dart';
import 'package:islami/features/login/data/repos/login_repository_impl.dart';
import 'package:islami/features/login/domain/usecases/login_usecase.dart';
import 'package:islami/features/login/presentation/login_view.dart';
import 'package:islami/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:islami/features/onBoarding/presentation/onboarding_view.dart';
import 'package:islami/features/radio/presentation/radio_view.dart';
import 'package:islami/features/splash/presentation/splash_view.dart';

import '../../features/main/presentation/main_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
  static const String surahDetailsRoute = '/surahDetails';
  static const String radioRoute = '/radio';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => BlocProvider(
          create: (_) => LoginCubit(
            LoginUseCase(LoginRepositoryImpl(FirebaseAuth.instance)),
          ),
          child: const LoginView(),
        ),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
      GoRoute(
        path: mainRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => FetchSurahsCubit(
            HomeUseCase(
              HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  ApiService(Dio()),
                ),
              ),
            ),
          )..fetshSurahs(),
          child: const MainView(),
        ),
      ),
      GoRoute(
        path: surahDetailsRoute,
        builder: (context, state) {
          final surahId = state.extra as int?;
          if (surahId == null) {
            return const Scaffold(
              body: Center(child: Text('حدث خطأ: السورة غير موجودة')),
            );
          }
          return BlocProvider(
            create: (context) => FetchSurahDetailsCubit(
              SurahDetailsUseCase(
                HomeRepoImpl(
                  homeLocalDataSource: HomeLocalDataSourceImpl(),
                  homeRemoteDataSource: HomeRemoteDataSourceImpl(
                    ApiService(Dio()),
                  ),
                ),
              ),
            )..fetchSurahDetails(surahId),
            child: SurahDetailsView(),
          );
        },
      ),
      GoRoute(path: radioRoute, builder: (context, state) => const RadioView()),
    ],
  );
}
