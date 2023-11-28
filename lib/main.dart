import 'package:flutter/material.dart';
import 'package:mk_aromatic_limited/landing_page/screens/landing_screen.dart';
import 'package:mk_aromatic_limited/landing_page/services/bottom_nav_service.dart';
import 'package:mk_aromatic_limited/screen/signin/signin.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignIn(),
      ),
    );
  }
}

// Create a class for your navigation items
