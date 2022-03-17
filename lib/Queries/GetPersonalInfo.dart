import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetName extends StatelessWidget {
  late final String documentId;

  GetName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference personal_info = FirebaseFirestore.instance.collection('personal_info');

    return FutureBuilder<DocumentSnapshot>(
      future: personal_info.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['first_name']}",
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

class GetWeight extends StatelessWidget {
  late final String documentId;

  GetWeight(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference personal_info = FirebaseFirestore.instance.collection('personal_info');

    return FutureBuilder<DocumentSnapshot>(
      future: personal_info.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
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
              child: Text("Weight" + ": " + "${data['weight']}",
                  style: const TextStyle(fontSize: 25 ,fontFamily: 'Bebas', color: Colors.white)),
            ),
          );

        }

        return Text("loading");
      },
    );
  }
}


class GetHeight extends StatelessWidget {
  late final String documentId;

  GetHeight(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference personal_info = FirebaseFirestore.instance.collection('personal_info');

    return FutureBuilder<DocumentSnapshot>(
      future: personal_info.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
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
              child: Text("Height" + ": " + "${data['height']}",
                  style: const TextStyle(fontSize: 25 ,fontFamily: 'Bebas', color: Colors.white)),
            ),
          );

        }

        return Text("loading");
      },
    );
  }
}

class GetBMI extends StatelessWidget {
  late final String documentId;

  GetBMI(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference personal_info = FirebaseFirestore.instance.collection('personal_info');

    return FutureBuilder<DocumentSnapshot>(
      future: personal_info.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
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
              child: Text("BMI" + ": " + "${data['bmi']}",
                  style: const TextStyle(fontSize: 25 ,fontFamily: 'Bebas', color: Colors.white)),
            ),
          );

        }

        return Text("loading");
      },
    );
  }
}