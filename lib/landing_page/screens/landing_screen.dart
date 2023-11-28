import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/landing_page/services/bottom_nav_service.dart';
import 'package:mk_aromatic_limited/main.dart';
import 'package:mk_aromatic_limited/screen/account/account_screen.dart';
import 'package:mk_aromatic_limited/screen/history/history_screen.dart';
import 'package:mk_aromatic_limited/screen/home/homescreen.dart';
import 'package:mk_aromatic_limited/screen/notification/notification_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<BottomNavigationModel>(
        builder: (context, model, child) {
          List<Widget> pages = [
            const HomeScreen(),
            const NotificationScreen(),
            const HistoryScreen(),
            const AccountScreen(),
          ];

          return pages[model.currentIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: context.watch<BottomNavigationModel>().currentIndex,
        onTap: (index) {
          context.read<BottomNavigationModel>().updateIndex(index);
        },
      ),
    );
  }
}
