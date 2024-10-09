import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
static final router = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) => const SplashView(),),
  GoRoute(path: '/HomeView',
  builder: (context, state) => const HomeView(),),
]);
}