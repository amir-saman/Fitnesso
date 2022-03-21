import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesso/AddWorkout.dart';
import 'package:fitnesso/PlatePage.dart';
import 'package:fitnesso/Queries/GetWorkouts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogBookPage extends StatelessWidget {
  static const String id = "log_book_page";
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Log Book"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.iso,
              color: Colors.white,
            ),
            tooltip: "Plate Calculator",
            onPressed: () {
              Navigator.pushNamed(context, PlateCalcPage.id);
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWorkout(),
            ),
          );
        },
        tooltip: "Add New Workout",
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logbook_screen.webp'),
            //colorFilter: ColorFilter.mode(Colors, BlendMode.color),
            fit: BoxFit.cover,
          ),
        ),
        child: GetWorkouts(uid!),
      ),
    );
  }
}
