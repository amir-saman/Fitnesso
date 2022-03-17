import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ElevatedWeekButtons extends StatefulWidget {
  const ElevatedWeekButtons({Key? key}) : super(key: key);

  @override
  _ElevatedWeekButtonsState createState() => _ElevatedWeekButtonsState();
}

class _ElevatedWeekButtonsState extends State<ElevatedWeekButtons> {
  final values = <bool?>[false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        WeekdaySelector(
          selectedFillColor: Colors.indigo.shade300,
          onChanged: (v) {
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

class MuscleGroupRadioButtons extends StatefulWidget {
  const MuscleGroupRadioButtons({Key? key}) : super(key: key);

  @override
  State<MuscleGroupRadioButtons> createState() =>
      _MuscleGroupRadioButtonsState();
}

enum muscleGroups { chest, back, shoulders, arms, legs }

class _MuscleGroupRadioButtonsState extends State<MuscleGroupRadioButtons> {
  muscleGroups? _character = muscleGroups.chest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Chest'),
          leading: Radio<muscleGroups>(
            value: muscleGroups.chest,
            groupValue: _character,
            onChanged: (muscleGroups? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Back'),
          leading: Radio<muscleGroups>(
            value: muscleGroups.back,
            groupValue: _character,
            onChanged: (muscleGroups? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Shoulders'),
          leading: Radio<muscleGroups>(
            value: muscleGroups.shoulders,
            groupValue: _character,
            onChanged: (muscleGroups? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Arms'),
          leading: Radio<muscleGroups>(
            value: muscleGroups.arms,
            groupValue: _character,
            onChanged: (muscleGroups? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Legs'),
          leading: Radio<muscleGroups>(
            value: muscleGroups.legs,
            groupValue: _character,
            onChanged: (muscleGroups? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ChestDropDown extends StatefulWidget {
  const ChestDropDown({Key? key}) : super(key: key);

  @override
  State<ChestDropDown> createState() => _ChestDropDownState();
}

class _ChestDropDownState extends State<ChestDropDown> {
  String dropdownValue = 'Flat Bench Press';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Flat Bench Press',
        'Mid Cable Fly',
        'Upper Cable Fly',
        'Lower Cable Fly',
        'Incline Press'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
