import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogBookPage extends StatelessWidget {
  const LogBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Book"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}