import 'package:go_router/go_router.dart';
import 'package:islami/features/home/presentation/home_view.dart';
import 'package:islami/features/login/presentation/login_view.dart';
import 'package:islami/features/onBoarding/presentation/onboarding_view.dart';
import 'package:islami/features/radio/presentation/radio_view.dart';
import 'package:islami/features/splash/presentation/splash_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String radioRoute = '/radio';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, stste) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingRoute,
        builder: (context, stste) => const OnboardingView(),
      ),
      GoRoute(path: loginRoute, builder: (context, stste) => const LoginView()),
      GoRoute(path: homeRoute, builder: (context, stste) => const HomeView()),
      GoRoute(path: radioRoute, builder: (context, stste) => const RadioView()),
    ],
  );
}
