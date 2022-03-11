import 'dart:ui';

import 'package:flutter/material.dart';

import 'homeWidgets.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(51, 153, 255, .1),
  100: Color.fromRGBO(51, 153, 255, .2),
  200: Color.fromRGBO(51, 153, 255, .3),
  300: Color.fromRGBO(51, 153, 255, .4),
  400: Color.fromRGBO(51, 153, 255, .5),
  500: Color.fromRGBO(51, 153, 255, .6),
  600: Color.fromRGBO(51, 153, 255, .7),
  700: Color.fromRGBO(51, 153, 255, .8),
  800: Color.fromRGBO(51, 153, 255, .9),
  900: Color.fromRGBO(51, 153, 255, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitnesso App',
      theme: ThemeData(
        //primarySwatch: MaterialColor(0xFFBC0300, color), //0xFFE73725
        primarySwatch: MaterialColor(0xFFd6585d, color),
        //primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Fitnesso'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0; starting code

  /*
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
   */ //starting code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent, // maybe change colour to back or smt

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_weight),
                label: 'Health'), //add a tabBar for BMI on Health Section
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Log Book'), //icon needs to be changed
          ],
          //onTap: _onItemTapped,
        ),
        drawer: const Drawer(),
        appBar: AppBar(
          title: Align(
              alignment: const Alignment(-1.135, 0), child: Text(widget.title)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {//TODO
              },
            )
          ],
        ),
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/homepage/background.jpg'),
              opacity: 0.8,
              colorFilter: ColorFilter.mode(Color(0xFFf4961f), BlendMode.color),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                const Text("Welcome Back", style: TextStyle(fontSize: 40)),
                const Text("IFAZ",
                    style: TextStyle(fontSize: 60, fontFamily: 'Yellowtail')),
                const Divider(
                    height: 49,
                    thickness: 8,
                    indent: 50,
                    endIndent: 50,
                    color: Colors.black),
                Image.asset(
                  'assets/images/homepage/default_profile_picture.png',
                  width: 150,
                  height: 150,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Wrap(
                      // ROW 1
                      spacing: 20,
                      children: <Widget>[
                        statBoxes("Weight", 70.2),
                        statBoxes("Height", 183.4),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      children: [
                        statBoxes("BMI", 25),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
