import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/onboarding/presentation/views/on_boardring_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const onBoardring = '/onBoardingView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: onBoardring, builder: (context, state) => const OnBoardringView()),
    ],
  );
}
