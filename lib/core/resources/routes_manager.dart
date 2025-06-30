import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/home/data/data_sources/home_local_data_source.dart';
import 'package:islami/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islami/features/home/data/repos/home_repo_impl.dart';
import 'package:islami/features/home/domain/usecases/home_use_case.dart';
import 'package:islami/features/home/presentation/manager/cubit/fetch_surahs_cubit.dart';
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
      GoRoute(path: mainRoute, builder: (context, state) => const MainView()),
      GoRoute(
        path: homeRoute,
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
          ),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: surahDetailsRoute,
        builder: (context, state) {
          return SurahDetailsView();
        },
      ),
      GoRoute(path: radioRoute, builder: (context, state) => const RadioView()),
    ],
  );
}
