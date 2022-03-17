import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ElevationExample extends StatefulWidget {
  @override
  _ElevationExampleState createState() => _ElevationExampleState();
}

class _ElevationExampleState extends State<ElevationExample> {
  final values = <bool?>[null, false, true, false, true, false, null];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        WeekdaySelector(
          selectedFillColor: Colors.indigo.shade300,
          onChanged: (v) {
            printIntAsDay(v);
            setState(() {
              values[v % 7] = !values[v % 7]!;
            });
          },
          selectedElevation: 15,
          elevation: 5,
          disabledElevation: 0,
          values: values,
        ),
      ],
    );
  }
}