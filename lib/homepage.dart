import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnesso/Queries/GetPersonalInfo.dart';
import 'package:fitnesso/homeWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase_io.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  CollectionReference personal_info =
      FirebaseFirestore.instance.collection('personal_info');

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = _auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text("Fitnesso"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            tooltip: "Logout",
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                GetName(uid!),
                const Divider(
                  height: 49,
                  thickness: 8,
                  indent: 50,
                  endIndent: 50,
                  color: Color(0x75757575),
                ),
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(
                      'assets/images/homepage/default_profile_picture.png'),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Wrap(
                      // ROW 1
                      spacing: 20,
                      children: <Widget>[
                        GetWeight(uid),
                        GetHeight(uid),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      children: [
                        GetBMI(uid),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
