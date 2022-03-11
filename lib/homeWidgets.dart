import 'dart:ui';

import 'package:fitnesso/main.dart';
import 'package:flutter/material.dart';

Widget statBoxes(String title, double result) {
  if (title == null || result == null) {
    return Container(
      height: 75,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text("Please Enter Details"),
      ),
    );//TODO update so it is same as below
  }

  String resultString = "$result";
  return Container(
    height: 60,
    width: 150,
    decoration: BoxDecoration(
      color: Color(0xFFE1E1E1),
      gradient: LinearGradient(
        colors: [Color(0xFFb85ab4).withOpacity(0.8), Color(0xFFb85ab4).withOpacity(0.8)],
        //colors: [Colors.deepOrange, Colors.redAccent],
          //colors: [Color(0xFF4C3232).withOpacity(0.7), Color(0xFFF98903)],
      ),
      borderRadius: BorderRadius.circular(50.0),
      boxShadow: [BoxShadow(
        color: Colors.purpleAccent.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0,0)
      )]
    ),
    child: Center(
      child: Text(title + ": " + resultString,
      style: const TextStyle(fontSize: 25 ,fontFamily: 'Bebas', color: Colors.white)),
    ),
  );
}


Widget BMIBox() {
  return Container(
    //TODO
  );
}

class HomeWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
