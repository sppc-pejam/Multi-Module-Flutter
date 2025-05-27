import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core_ui/screens/splash_screen.dart';
import '../dashboard/presentation/screens/dashboard_screen.dart';
import '../dashboard/presentation/screens/home_screen.dart';
import '../dashboard/presentation/screens/settings_screen.dart';
import '../product/presentation/screens/create_product_screen.dart';
import '../product/presentation/screens/product_list_screen.dart';
import '../user/presentation/screens/create_user_screen.dart';
import '../user/presentation/screens/login_screen.dart';
import '../user/presentation/screens/user_list_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return DashboardScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        final username = state.pathParameters['username'] ?? 'کاربر';
        return HomeScreen(username: username, child: child);
      },
      routes: [
        GoRoute(
          path: '/:username',
          builder: (context, state) => DashboardScreen(),
        ),
        GoRoute(
          path: '/:username/users',
          builder: (context, state) => UserListScreen(),
        ),
        GoRoute(
          path: '/:username/users/create',
          builder: (context, state) => CreateUserScreen(),
        ),
        GoRoute(
          path: '/:username/products',
          builder: (context, state) => ProductListScreen(),
        ),
        GoRoute(
          path: '/:username/products/create',
          builder: (context, state) => CreateProductScreen(),
        ),
        GoRoute(
          path: '/:username/settings',
          builder: (context, state) => SettingsScreen(),
        ),
      ],
    ),
  ],
);
