import 'dart:ui';

import 'package:fitnesso/homeWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitnesso"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              //TODO
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homepage/background.jpg'),
              opacity: 0.8,
              colorFilter: ColorFilter.mode(Color(0xFFf4961f), BlendMode.color),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Text("Welcome Back", style: TextStyle(fontSize: 40)),
              const Text(
                "USER",
                style: TextStyle(
                    fontSize: 60, fontFamily: 'Yellowtail', letterSpacing: 3),
              ),
              const Divider(
                  height: 49,
                  thickness: 8,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.black),
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(
                    'assets/images/homepage/default_profile_picture.png'),
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
                      statBoxes("BMI", 25.0),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
