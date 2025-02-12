import 'package:flutter/material.dart';
import 'package:multi_module_flutter/dashboard/presentation/screens/slide_menu.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final Widget child;

  const HomeScreen({super.key, required this.username, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(title: Text("داشبورد")),
      drawer: isDesktop ? null : SideMenu(username: username),
      body: Row(
        children: [
          if (isDesktop) SizedBox(width: 250, child: SideMenu(username: username)), // نمایش منوی همیشگی در دسکتاپ
          Expanded(child: child), // نمایش محتوای صفحات مختلف
        ],
      ),
    );
  }
}
