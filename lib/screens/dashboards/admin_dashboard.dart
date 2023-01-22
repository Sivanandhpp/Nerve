import 'package:flutter/material.dart';
import 'admin_navbar.dart' as admin;
import '../main/screen_about.dart';
import '../main/screen_notification.dart';
import '../main/screen_home.dart';
import '../main/screen_upload.dart';

class AdminDashBoard extends StatelessWidget {
  AdminDashBoard({Key? key}) : super(key: key);
  final _pages = [
    const HomeScreen(),
    const ScreenUpload(),
    const ScreenNotification(),
    const ScreenAbout(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: admin.indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const admin.AdminNavBar(),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
