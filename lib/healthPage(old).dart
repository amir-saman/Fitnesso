
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesso/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
class HealthPage extends StatelessWidget {
  static const String id = "log_book_page";
  final _auth = FirebaseAuth.instance;


  static GlobalKey<FormState> weightFormkey = GlobalKey<FormState>();
  static GlobalKey<FormState> heightFormkey = GlobalKey<FormState>();

  late double weight;
  late double height;

  @override
  Widget build(BuildContext context) {

    CollectionReference personal_info =
        FirebaseFirestore.instance.collection('personal_info');

    final User? user = _auth.currentUser;
    final uid = user?.uid;
    return Scaffold(


      appBar: AppBar(
        title: const Text("Health"),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/health_screen.jpg'),
            //colorFilter: ColorFilter.mode(Colors, BlendMode.color),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white38,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Update Details",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepOrange,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: weightFormkey,
                  child: Row(
                    children: [
                      Text(
                        "New Weight:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          onChanged: (value) {
                            weight = double.parse(value);
                          },
                          validator: (value) {
                      if (value!.isEmpty) {
                      return 'Required';
                      } else {
                      return null;
                      }
                      },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              suffixText: "kg",
                              border: OutlineInputBorder(),
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        //padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color: Colors.indigo.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          elevation: 2.0,
                          child: MaterialButton(
                            onPressed: () async {
                              final isValid = weightFormkey.currentState!.validate();
                              if (isValid) {

                                try {
                                  personal_info.doc(uid).update({
                                    "weight" : weight
                                  }
                                  );

                                  Navigator.pushNamed(context, Fitnesso.id);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            child: const Text(
                              'Submit',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: heightFormkey,
                  child: Row(
                    children: [
                      Text(
                        "New Height:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          onChanged: (value) {
                            height = double.parse(value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              suffixText: "cm",
                              border: OutlineInputBorder(),
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        //padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color: Colors.indigo.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          elevation: 2.0,
                          child: MaterialButton(
                            onPressed: () async {
                              final isValid = heightFormkey.currentState!.validate();
                              if (isValid) {

                                try {
                                  personal_info.doc(uid).update({
                                    "height" : height
                                  }
                                  );

                                  Navigator.pushNamed(context, Fitnesso.id);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            child: const Text(
                              'Submit',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */
