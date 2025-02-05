import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/services/local/hive_service.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hiveService = GetIt.instance<HiveService>(); // گرفتن HiveService از GetIt
    final token = hiveService.getToken() ?? 'توکنی ذخیره نشده!';

    return Scaffold(
      appBar: AppBar(title: const Text("داشبورد")),
      body: Center(
        child: Text(
          "توکن شما: $token",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
