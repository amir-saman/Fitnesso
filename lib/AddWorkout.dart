import 'package:fitnesso/logBookPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'weekButtons.dart';

TextStyle newWorkoutTS =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
SizedBox spaceInbetween = const SizedBox(height: 20);
enum muscleGroups { chest, back, shoulders, arms, legs }
muscleGroups? _muscleGroup = muscleGroups.chest;

Widget pickDropdown() {
  if (_muscleGroup == muscleGroups.chest) {
    return const ChestDropDown();
  }
  if (_muscleGroup == muscleGroups.back) {
    return const BackDropDown();
  }
  if (_muscleGroup == muscleGroups.shoulders) {
    return const ShouldersDropDown();
  }
  if (_muscleGroup == muscleGroups.arms) {
    return const ArmsDropDown();
  }
  if (_muscleGroup == muscleGroups.legs) {
    return const LegsDropDown();
  } else
    return const Text("error");
}

String getMuscleGroup() {
  if (_muscleGroup == muscleGroups.chest) {
    return "Chest";
  }
  if (_muscleGroup == muscleGroups.back) {
    return "Back";
  }
  if (_muscleGroup == muscleGroups.shoulders) {
    return "Shoulders";
  }
  if (_muscleGroup == muscleGroups.arms) {
    return "Arms";
  }
  if (_muscleGroup == muscleGroups.legs) {
    return "Legs";
  } else {
    return "error";
  }
}

String getDropDownValue() {
  if (_muscleGroup == muscleGroups.chest) {
    return getChest();
  }
  if (_muscleGroup == muscleGroups.back) {
    return getBack();
  }
  if (_muscleGroup == muscleGroups.shoulders) {
    return getShoulders();
  }
  if (_muscleGroup == muscleGroups.arms) {
    return getArms();
  }
  if (_muscleGroup == muscleGroups.legs) {
    return getLegs();
  } else
    return "error";
}

class AddWorkout extends StatefulWidget {
  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final String uid = "check_the_code";

  final formkey = GlobalKey<FormState>();

  late String muscleGroup;
  late String workoutName = "check_the_code";
  late int currentMax;

  late int s1w;
  late int s1r;
  late int s2w;
  late int s2r;
  late int s3w;
  late int s3r;

  @override
  final examples = <Widget>[const ElevatedWeekButtons()];
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final uid = user?.uid;

    CollectionReference workouts = FirebaseFirestore.instance
        .collection('workouts')
        .doc(uid)
        .collection("workouts");

    // CollectionReference set1 = FirebaseFirestore.instance
    //     .collection('workouts')
    //     .doc(uid)
    //     .collection("workouts")
    //     .doc(workoutName)
    //     .collection("sets");
    //
    // CollectionReference set2 = FirebaseFirestore.instance
    //     .collection('workouts')
    //     .doc(uid)
    //     .collection("workouts")
    //     .doc(workoutName)
    //     .collection("sets");
    //
    // CollectionReference set3 = FirebaseFirestore.instance
    //     .collection('workouts')
    //     .doc(uid)
    //     .collection("workouts")`
    //     .doc(workoutName)
    //     .collection("sets");

    Future<void> addWorkouts() {
      return workouts
          .doc(workoutName)
          .set({
            'muscle_group': muscleGroup,
            'workout_name': workoutName,
            'set1w': s1w,
            'set1r': s1r,
            'set2w': s2w,
            'set2r': s2r,
            'set3w': s3w,
            'set3r': s3r,
          })
          .then((value) => print("Workout and Muscle Group Added"))
          .catchError((error) =>
              print("Failed to add Workout and Muscle Group Added: $error"));
    }

    /* for unlimited sets i think but i dont know how to implement into stream
    Future<void> addSet1() {
      return FirebaseFirestore.instance
          .collection('workouts')
          .doc(uid)
          .collection("workouts")
          .doc(workoutName)
          .collection("sets")
          .doc("1")
          .set({
            'weight': s1w,
            'rep': s1r,
          })
          .then((value) => print("Set 1 Added"))
          .catchError((error) => print("Failed to add Set 1: $error"));
    }

    Future<void> addSet2() {
      return FirebaseFirestore.instance
          .collection('workouts')
          .doc(uid)
          .collection("workouts")
          .doc(workoutName)
          .collection("sets")
          .doc("2")
          .set({
            'weight': s2w,
            'rep': s2r,
          })
          .then((value) => print("Set 2 Added"))
          .catchError((error) => print("Failed to add Set 2: $error"));
    }

    Future<void> addSet3() {
      return FirebaseFirestore.instance
          .collection('workouts')
          .doc(uid)
          .collection("workouts")
          .doc(workoutName)
          .collection("sets")
          .doc("3")
          .set({
            'weight': s3w,
            'rep': s3r,
          })
          .then((value) => print("Set 3 Added"))
          .catchError((error) => print("Failed to add Set 3: $error"));
    }

     */

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Workout")),
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
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "When",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      children: const [
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
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Chest'),
                              leading: Radio<muscleGroups>(
                                value: muscleGroups.chest,
                                groupValue: _muscleGroup,
                                onChanged: (muscleGroups? value) {
                                  setState(() {
                                    _muscleGroup = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Back'),
                              leading: Radio<muscleGroups>(
                                value: muscleGroups.back,
                                groupValue: _muscleGroup,
                                onChanged: (muscleGroups? value) {
                                  setState(() {
                                    _muscleGroup = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Shoulders'),
                              leading: Radio<muscleGroups>(
                                value: muscleGroups.shoulders,
                                groupValue: _muscleGroup,
                                onChanged: (muscleGroups? value) {
                                  setState(() {
                                    _muscleGroup = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Arms'),
                              leading: Radio<muscleGroups>(
                                value: muscleGroups.arms,
                                groupValue: _muscleGroup,
                                onChanged: (muscleGroups? value) {
                                  setState(() {
                                    _muscleGroup = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Legs'),
                              leading: Radio<muscleGroups>(
                                value: muscleGroups.legs,
                                groupValue: _muscleGroup,
                                onChanged: (muscleGroups? value) {
                                  setState(() {
                                    _muscleGroup = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    spaceInbetween,
                    Text("Select a Workout", style: newWorkoutTS),
                    pickDropdown(),
                    spaceInbetween,
                    Row(
                      children: [
                        Text("Current Max (kg)", style: newWorkoutTS),
                        const SizedBox(
                          width: 170,
                        ),
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                suffixText: "kg",
                                border: OutlineInputBorder(),
                                filled: true),
                            onChanged: (value) {
                              currentMax = int.parse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    Wrap(children: const []),
                    spaceInbetween,
                    Row(
                      children: [
                        Text("Number of Sets", style: newWorkoutTS),
                        const SizedBox(
                          width: 180,
                        ),
                        const Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                suffixText: "sets",
                                border: OutlineInputBorder(),
                                filled: true),
                          ),
                        ),
                      ],
                    ),
                    spaceInbetween,
                    /* //TODO suggested intensity
                    Container(
                      decoration: BoxDecoration(color: Colors.white54),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Suggested Intensity",
                                  style: newWorkoutTS,
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Flexible(
                                  //padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Material(
                                    color: Colors.indigo.shade300,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    elevation: 2.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        print(getChest());
                                      },
                                      child: const Text(
                                        'Calculate',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Set 1:",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(""),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Set 2:",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Set 3:",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                     */
                    Text(
                      "Pick Your Intensity",
                      style: newWorkoutTS,
                    ),
                    spaceInbetween,
                    Row(
                      children: [
                        const Text(
                          "Set 1:",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s1w = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "kg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s1r = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "reps",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Set 2:",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s2w = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "kg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s2r = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "reps",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Set 3:",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s3w = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "kg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 25,
                            //width: 200,
                            child: TextFormField(
                              onChanged: (value) {
                                s3r = int.parse(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This is a required field';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white54,
                                filled: true,
                                suffixText: "reps",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color: Colors.indigo.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () async {
                              final isValid = formkey.currentState!.validate();
                              if (isValid) {
                                workoutName = getDropDownValue();
                                muscleGroup = getMuscleGroup();
                                try {
                                  addWorkouts();

                                  // addSet1();
                                  // addSet2();
                                  // addSet3();

                                  Navigator.pop(context);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: const Text(
                              'Add Workout',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
