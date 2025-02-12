import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  final String username;

  const SideMenu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, Icons.home, "داشبورد", '/$username'),
                _buildExpandableMenu(
                  context,
                  title: "کاربران",
                  icon: Icons.person,
                  items: [
                    _buildMenuItem(context, Icons.list, "لیست کاربران",
                        '/$username/users'),
                    _buildMenuItem(context, Icons.person_add,
                        "ایجاد کاربر جدید", '/$username/users/create'),
                  ],
                ),
                _buildExpandableMenu(
                  context,
                  title: "محصولات",
                  icon: Icons.shopping_cart,
                  items: [
                    _buildMenuItem(context, Icons.list, "لیست محصولات",
                        '/$username/products'),
                    _buildMenuItem(context, Icons.add_box, "ایجاد محصول جدید",
                        '/$username/products/create'),
                  ],
                ),
                Divider(),
                _buildMenuItem(
                    context, Icons.settings, "تنظیمات", '/$username/settings'),
                _buildMenuItem(context, Icons.exit_to_app, "خروج", '/logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.only(topRight: Radius.circular(24)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/profile.jpg"), // جایگزین کنید
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "مدیر سیستم",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, size: 22, color: Colors.blueGrey),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {
        context.go(route);
        Scaffold.of(context).closeDrawer();
      },
    );
  }

  Widget _buildExpandableMenu(BuildContext context,
      {required String title,
      required IconData icon,
      required List<Widget> items}) {
    return ExpansionTile(
      leading: Icon(icon, size: 22, color: Colors.blueGrey),
      title: Text(title, style: TextStyle(fontSize: 16)),
      children: items,
    );
  }
}
