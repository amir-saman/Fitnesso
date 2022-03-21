import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
//import 'package:fitnesso/loginScreens/login_screen.dart';
//import 'package:fitnesso/loginScreens/registration_screen.dart';
//import 'package:fitnesso/loginScreens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'PlatePage.dart';
import 'healthPage.dart';
import 'homepage.dart';
import 'logBookPage.dart';
import 'loginScreens/login_screen.dart';
import 'loginScreens/registration_screen.dart';
import 'loginScreens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

Map<int, Color> color = {
  50: const Color.fromRGBO(51, 153, 255, .1),
  100: const Color.fromRGBO(51, 153, 255, .2),
  200: const Color.fromRGBO(51, 153, 255, .3),
  300: const Color.fromRGBO(51, 153, 255, .4),
  400: const Color.fromRGBO(51, 153, 255, .5),
  500: const Color.fromRGBO(51, 153, 255, .6),
  600: const Color.fromRGBO(51, 153, 255, .7),
  700: const Color.fromRGBO(51, 153, 255, .8),
  800: const Color.fromRGBO(51, 153, 255, .9),
  900: const Color.fromRGBO(51, 153, 255, 1),
};

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitnesso App',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFd6585d, color),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        Fitnesso.id: (context) => Fitnesso(),
        //TODO healthpage
        LogBookPage.id: (context) => LogBookPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PlateCalcPage.id: (context) => PlateCalcPage(),
      },
    );
  }
}

class Fitnesso extends StatefulWidget {
  static const String id = "homepage";

  @override
  _FitnessoState createState() => _FitnessoState();
}

class _FitnessoState extends State<Fitnesso> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      HomePage(),
      HealthPage(),
      LogBookPage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.blueAccent,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight),
              label: 'Health'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Log Book'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
