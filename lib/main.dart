import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/controller/authentication/registration/registration.dart';
import 'package:mk_aromatic_limited/controller/edit%20profile/edit_profile.dart';
import 'package:mk_aromatic_limited/controller/authentication/login/login.dart';
import 'package:mk_aromatic_limited/screen/home/innerscreen/address_screen.dart';
import 'package:mk_aromatic_limited/screen/landing_page/screens/landing_screen.dart';

import 'package:mk_aromatic_limited/screen/landing_page/services/bottom_nav_service.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen1.dart';
import 'package:mk_aromatic_limited/screen/common%20screen/choosescreen6.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';
import 'package:mk_aromatic_limited/screen/signup/signup.dart';
import 'package:mk_aromatic_limited/screen/splashscreen/splashscreen.dart';

import 'package:provider/provider.dart';

void main() {
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddressScreen(),
      ),
    );
  }
}
