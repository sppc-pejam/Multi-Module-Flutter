import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_module_flutter/config/app_router.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ایجاد تأخیر برای اسپلش اسکرین و هدایت به صفحه بعد
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(Duration(seconds: 2)); // مدت زمان نمایش اسپلش
    // هدایت به صفحه بعدی (مثلاً صفحه لاگین)
    context.router.push(const LoginRoute()); // استفاده از AutoRoute
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // رنگ پس‌زمینه یا هر رنگ دلخواه
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logo_dev, // یا هر آیکونی که لوگوی اپلیکیشن شما باشد
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to My App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
