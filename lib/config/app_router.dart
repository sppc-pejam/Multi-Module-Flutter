import 'package:auto_route/auto_route.dart';
import 'package:multi_module_flutter/core_ui/screens/login_screen.dart';
import 'package:multi_module_flutter/core_ui/screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
