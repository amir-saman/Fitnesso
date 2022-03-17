import 'dart:ui';

import 'package:fitnesso/weekButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class LogBookPage extends StatelessWidget {

  static const String id = "log_book_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Book"),
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
    );
  }
}

TextStyle newWorkoutTS = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
SizedBox spaceInbetween = SizedBox(height: 20);

class AddWorkout extends StatelessWidget {
  @override
  final examples = <Widget>[ElevatedWeekButtons()];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Workout")),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logbook/dumbbell.jpg'),
              opacity: 0.8,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "When",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    children: [
                      ElevatedWeekButtons(),
                    ],
                  ),
                  spaceInbetween,
                  Wrap(
                    children: [
                      Text(
                        "Muscle Group",
                        style: newWorkoutTS,
                      ),
                      MuscleGroupRadioButtons(),
                    ],
                  ),
                  spaceInbetween,
                  Text("Select a Workout", style: newWorkoutTS),
                  ChestDropDown(),
                  spaceInbetween,
                  Text("Current Max (kg)", style: newWorkoutTS),
                  Wrap(children: const [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true
                      ),
                    )
                  ]),
                  spaceInbetween,
                  Text(
                    "Number of Sets",
                    style: newWorkoutTS,
                  ),
                  Wrap(
                    children: const [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true
                          /*
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Number of Sets'),
                         *///adds a text hint
                      ),
                      ),
                    ],
                  ),
                  spaceInbetween,
                  Text(
                    "Suggested Intensity",
                    style: newWorkoutTS,
                  ),
                  spaceInbetween,
                  Wrap(
                    children: [
                      Container(

                        child: Text(
                          "Set 1:",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextField(

                        )
                      ),
                    ],
                  ),
                  Wrap(
                    children: const [
                      Text(
                        "Set 2:",
                        style: TextStyle(fontSize: 20),
                      ),
                      /*
                      TextField(

                      )

                       */
                    ]
                  ),
                  Wrap(
                    children: const [
                      Text(
                        "Set 3:",
                        style: TextStyle(fontSize: 20),

                      ),
                    ]
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
