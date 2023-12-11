import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/common/notification_helper.dart';
import 'package:mk_aromatic_limited/constants/core/app_constant.dart';
import 'package:mk_aromatic_limited/controller/add%20address/add_address_controller.dart';
import 'package:mk_aromatic_limited/controller/appSetting/appsettingcontroller.dart';
import 'package:mk_aromatic_limited/controller/authentication/forgot%20password/forgotpassword_controller.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:mk_aromatic_limited/controller/edit%20address/edit_address.dart';
import 'package:mk_aromatic_limited/controller/edit%20profile/edit_profile.dart';
import 'package:mk_aromatic_limited/controller/authentication/login/login.dart';
import 'package:mk_aromatic_limited/controller/getAddress/get_address_controller.dart';
import 'package:mk_aromatic_limited/controller/history/history.dart';
import 'package:mk_aromatic_limited/controller/notification/notificatoncoontroller.dart';
import 'package:mk_aromatic_limited/controller/remove%20address/remove_address.dart';
import 'package:mk_aromatic_limited/controller/waste%20pickup/pickup.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/bookingconfirmed.dart';

import 'package:mk_aromatic_limited/screen/landing_page/services/bottom_nav_service.dart';
import 'package:mk_aromatic_limited/screen/signin/forgot%20password/email_field.dart';

import 'package:mk_aromatic_limited/screen/splashscreen/splashscreen.dart';

import 'package:provider/provider.dart';

int notifId = 0;
@pragma('vm:entry-point')
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(
      FireBasePushNotificationService.firebaseMessagingBackgroundHandler,
    );
  } catch (error) {
    print('Error initializing Firebase: $error');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileEditProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryController(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetAddressController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdddAddressController(),
        ),
        ChangeNotifierProvider(
          create: (_) => RemoveAddressController(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditAddressController(),
        ),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => AppsettingController()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordController()),
        ChangeNotifierProvider(create: (_) => NotificationController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstant.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
