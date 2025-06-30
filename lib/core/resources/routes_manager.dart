import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      GoRoute(path: homeRoute, builder: (context, state) => const MainView()),
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
