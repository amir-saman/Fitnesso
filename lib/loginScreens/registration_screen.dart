import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final formkey = GlobalKey<FormState>();

  late String name;
  late double weight;
  late double height;

  late String email;
  late String password;

  late final String uid;

  @override
  Widget build(BuildContext context) {

    CollectionReference personal_info =
    FirebaseFirestore.instance.collection('personal_info');

    int bmiCalc(double w, double h){
      double bmi;
      bmi = w/h;
      bmi = bmi/h;
      bmi = bmi * 10000;
      return bmi.round();
    }

    Future<void> addPersonalInfo() {
      return personal_info.doc(_auth.currentUser?.uid).set({
        'email' : email,
        'name' : name,
        'weight' : weight,
        'height' : height,
        'bmi' : bmiCalc(weight, height)
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add personal info: $error"));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/registration_screen.jpg'),
            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          hintText: 'Enter your email',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF9800), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF9800), width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'enter at least 6 characters';
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          hintText: 'Enter your password',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: const OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(32.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF9800), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFFF9800), width: 2.0),
                            borderRadius:
                            BorderRadius.all(const Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          } else {
                            return null;
                          }
                        },
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          name = value;
                          //Do something with the user input.
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white30,
                          hintText: 'Name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF9800), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF9800), width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your weight';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                weight = double.parse(value);
                                //Do something with the user input.
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                hintText: 'Weight (kg)',
                                suffixText: "kg",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF9800), width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF9800), width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your height';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                height = double.parse(value);
                                //Do something with the user input.
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                hintText: 'Height (cm)',
                                suffixText: "cm",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF9800), width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFF9800), width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: const Color(0xFFFF9800),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        final isValid = formkey.currentState!.validate();
                        if (isValid) {
                          try {
                            final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newUser != null) {
                              await addPersonalInfo();

                              Navigator.pushNamed(context, Fitnesso.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Register',
                      ),
                    ),
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
