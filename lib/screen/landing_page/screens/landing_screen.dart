import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/constants/global_variables.dart';
import 'package:mk_aromatic_limited/screen/landing_page/services/bottom_nav_service.dart';
import 'package:mk_aromatic_limited/screen/account/account_screen.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen6.dart';
import 'package:mk_aromatic_limited/screen/history/history_screen.dart';
import 'package:mk_aromatic_limited/screen/home/homescreen.dart';
import 'package:mk_aromatic_limited/screen/notification/notification_screen.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  TextEditingController emailController = TextEditingController();
  int selectedButtonIndex = -1; // Maintain the selected button index

  @override
  Widget build(BuildContext context) {
    final ScreemHight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //appBar: AppBar(),
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
        fixedColor: Colors.black,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
              color: GlobalVariabels.appColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 35,
              color: GlobalVariabels.appColor,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 35,
              color: GlobalVariabels.appColor,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            //  backgroundColor: GlobalVariabels.appColor,
            icon: Icon(
              Icons.person_2_outlined,
              size: 35,
              color: GlobalVariabels.appColor,
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




//  Scaffold(
//       appBar: AppBar(),
//       body: Consumer<BottomNavigationModel>(
//         builder: (context, model, child) {
//           List<Widget> pages = [
//             const HomeScreen(),
//             const NotificationScreen(),
//             const HistoryScreen(),
//             const AccountScreen(),
//           ];

//           return pages[model.currentIndex];
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.amber,
//         elevation: 0,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.black,
//             ),
//             label: 'Notification',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.history,
//               color: Colors.black,
//             ),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: Colors.black,
//             ),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: context.watch<BottomNavigationModel>().currentIndex,
//         onTap: (index) {
//           context.read<BottomNavigationModel>().updateIndex(index);
//         },
//       ),
//     );