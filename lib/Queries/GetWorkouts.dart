import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetWorkouts extends StatelessWidget {
  late final String uid;

  GetWorkouts(this.uid);

  @override
  Widget build(BuildContext context) {
    CollectionReference workouts = FirebaseFirestore.instance
        .collection("workouts")
        .doc(uid)
        .collection("workouts");

    return StreamBuilder<QuerySnapshot>(
        stream: workouts.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("There is no workouts");
          return ListView(children: getWorkoutsItems(snapshot));
        });
  }

  getWorkoutsItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map(
          (doc) => Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () async {
                int s1w = doc["set1w"];
                int s1r = doc["set1r"];
                int s2w = doc["set2w"];
                int s2r = doc["set2r"];
                int s3w = doc["set3w"];
                int s3r = doc["set3r"];
                String workoutName = doc["workout_name"];

                if (s1r > 11) {
                  s1r = 8;
                  s1w = s1w + 5;
                } else {
                  s1r = s1r + 1;
                }

                if (s2r > 11) {
                  s2r = 8;
                  s2w = s2w + 5;
                } else {
                  s2r = s2r + 1;
                }

                if (s3r > 11) {
                  s3r = 8;
                  s3w = s3w + 5;
                } else {
                  s3r = s3r + 1;
                }
                FirebaseFirestore.instance
                    .collection("workouts")
                    .doc(uid)
                    .collection("workouts")
                    .doc(workoutName)
                    .update({
                      'set1w': s1w,
                      'set1r': s1r,
                      'set2w': s2w,
                      'set2r': s2r,
                      'set3w': s3w,
                      'set3r': s3r,
                    })
                    .then((value) => print("Workout and Muscle Group Added"))
                    .catchError((error) => print(
                        "Failed to add Workout and Muscle Group Added: $error"));
              },
              child: SizedBox(
                width: 300,
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        doc["workout_name"],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(doc["muscle_group"]),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Set 1: " +
                                        doc["set1w"].toString() +
                                        "kg for " +
                                        doc["set1r"].toString() +
                                        " reps",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Text(
                                  "Set 2: " +
                                      doc["set2w"].toString() +
                                      "kg for " +
                                      doc["set2r"].toString() +
                                      " reps",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Set 3: " +
                                        doc["set3w"].toString() +
                                        "kg for " +
                                        doc["set3r"].toString() +
                                        " reps",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "TAP THE CARD \nIF ALL TARGETS\nARE HIT", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                              )
                            ],
                          ), /*
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 170,
                                height: 120,
                                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Material(
                                  color: Colors.deepOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)),
                                  elevation: 2.0,
                                  child: MaterialButton(
                                    onPressed: () ,
                                    child: const Text(
                                      'Target hit?',
                                    ),
                                  ),
                                ),
                              ),
                            ],

                          ),
                          */
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ).toList();
  }
}

/*
    getWorkoutsItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs.map((doc) => Card(
      child: Column(
        children: [
          Text(doc["workout_name"]),
        Text(doc["muscle_group"])
        ],
      ),
    ),
    ).toList();
  }

 */

/*
class GetWorkout extends StatelessWidget {
  late final String uid;

  GetWorkout(this.uid);

  @override
  Widget build(BuildContext context) {
    CollectionReference workouts =FirebaseFirestore.instance
        .collection('workouts')
        .doc(uid)
        .collection("workouts");

    return FutureBuilder<DocumentSnapshot>(
      future: workouts.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['name']}",
            style: TextStyle(
              fontSize: 60,
              fontFamily: 'Yellowtail',
              letterSpacing: 3,
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}

 */
