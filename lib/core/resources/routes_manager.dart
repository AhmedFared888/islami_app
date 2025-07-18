import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/utils/functions/service_locator.dart';
import 'package:islami/features/auth/forget_password/data/repos/forget_password_repo_impl.dart';
import 'package:islami/features/auth/forget_password/domain/usecases/reset_password_usecase.dart';
import 'package:islami/features/auth/forget_password/presentation/manager/cubit/forgetpassword_cubit.dart';
import 'package:islami/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:islami/features/auth/login/data/repos/login_repository_impl.dart';
import 'package:islami/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:islami/features/auth/login/presentation/login_view.dart';
import 'package:islami/features/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:islami/features/auth/register/data/repos/register_repo_impl.dart';
import 'package:islami/features/auth/register/domain/usecases/register_usecase.dart';
import 'package:islami/features/auth/register/presentation/manager/cubit/register_cubit.dart';
import 'package:islami/features/auth/register/presentation/views/register_view.dart';
import 'package:islami/features/azkar/data/repos/azkar_details_repo.dart';
import 'package:islami/features/azkar/domain/usecases/azkar_details_use_case.dart';
import 'package:islami/features/azkar/presentation/manager/cubit/fetch_azkar_cubit.dart';
import 'package:islami/features/azkar/presentation/views/azkar_details_view.dart';
import 'package:islami/features/azkar/presentation/views/azkar_view.dart';
import 'package:islami/features/home/data/repos/home_repo_impl.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/domain/usecases/home_use_case.dart';
import 'package:islami/features/home/domain/usecases/surah_details_use_case.dart';
import 'package:islami/features/home/presentation/manager/fetch_surah_details_cubit/fetch_surah_details_cubit.dart';
import 'package:islami/features/home/presentation/manager/fetch_surahs_cubit/fetch_surahs_cubit.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/home/presentation/views/surah_details_view.dart';
import 'package:islami/features/onBoarding/presentation/onboarding_view.dart';
import 'package:islami/features/radio/presentation/views/radio_view.dart';
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
  static const String azkarRoute = '/azkar';
  static const String azkarDetailsRoute = '/azkarDetails';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';

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
      GoRoute(
        path: registerRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(
            RegisterUsecase(RegisterRepoImpl(FirebaseAuth.instance)),
          ),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: forgetPasswordRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordCubit(
            ForgetPasswordUsecase(
              ForgetPasswordRepoImpl(FirebaseAuth.instance),
            ),
          ),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
      GoRoute(
        path: mainRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              FetchSurahsCubit(HomeUseCase(getIt.get<HomeRepoImpl>()))
                ..fetshSurahs(),
          child: const MainView(),
        ),
      ),
      GoRoute(
        path: surahDetailsRoute,
        builder: (context, state) {
          final surahEntity = state.extra as SurahEntity?;
          if (surahEntity == null) {
            return const Scaffold(
              body: Center(child: Text('حدث خطأ: السورة غير موجودة')),
            );
          }
          return BlocProvider(
            create: (context) => FetchSurahDetailsCubit(
              SurahDetailsUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchSurahDetails(surahEntity.numberOfSurah),
            child: SurahDetailsView(surahEntity: surahEntity),
          );
        },
      ),
      GoRoute(path: radioRoute, builder: (context, state) => const RadioView()),
      GoRoute(path: azkarRoute, builder: (context, state) => const AzkarView()),
      GoRoute(
        path: azkarDetailsRoute,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>;
          final String category = extra['category']!;
          final String title = extra['title']!;

          return BlocProvider(
            create: (context) => FetchAzkarCubit(
              AzkarDetailsUseCase(getIt.get<AzkarDetailsRepoImpl>()),
            )..fetshAzkar(category),
            child: AzkarDetailsView(category: category, title: title),
          );
        },
      ),
    ],
  );
}
