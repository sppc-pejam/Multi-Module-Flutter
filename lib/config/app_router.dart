import 'package:auto_route/auto_route.dart';

import '../core_ui/screens/splash_screen.dart';
import '../dashboard/presentation/screens/dashboard_screen.dart';
import '../user/presentation/screens/login_screen.dart';


part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/dashboard', page: DashboardRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
