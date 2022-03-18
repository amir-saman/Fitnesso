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

String dropdownChest = 'Flat Bench Press';

String getChest(){
  return dropdownChest;
}

class _ChestDropDownState extends State<ChestDropDown> {



  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownChest,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownChest = newValue!;
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

class BackDropDown extends StatefulWidget {
  const BackDropDown({Key? key}) : super(key: key);

  @override
  State<BackDropDown> createState() => _BackDropDownState();
}
String dropdownBack = 'Lat Pull Down';

String getBack(){
  return dropdownBack;
}


class _BackDropDownState extends State<BackDropDown> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownBack,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownBack = newValue!;
        });
      },
      items: <String>[
        'Lat Pull Down',
        'Bent Over Barbell Row',
        'Dumbbell Row',
        'Pull Ups',
        'Seated Cable Row'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ShouldersDropDown extends StatefulWidget {
  const ShouldersDropDown({Key? key}) : super(key: key);

  @override
  State<ShouldersDropDown> createState() => _ShouldersDropDownState();
}

String dropdownShoulders = 'Barbell Overhead Press';

String getShoulders(){
  return dropdownShoulders;
}

class _ShouldersDropDownState extends State<ShouldersDropDown> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownShoulders,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownShoulders = newValue!;
        });
      },
      items: <String>[
        'Barbell Overhead Press',
        'Seated Dumbbell Shoulder Press',
        'Side Lateral Raises',
        'Front Raises',
        'Rear Delt Fly'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ArmsDropDown extends StatefulWidget {
  const ArmsDropDown({Key? key}) : super(key: key);

  @override
  State<ArmsDropDown> createState() => _ArmsDropDownState();
}

String dropdownArms = 'Barbell Curl';

String getArms(){
  return dropdownArms;
}



class _ArmsDropDownState extends State<ArmsDropDown> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownArms,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownArms = newValue!;
        });
      },
      items: <String>[
        'Barbell Curl',
        'Dumbbell Curl',
        'Hammer Curl',
        'Cable Push Downs',
        'Laying Triceps Extensions'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class LegsDropDown extends StatefulWidget {
  const LegsDropDown({Key? key}) : super(key: key);

  @override
  State<LegsDropDown> createState() => _LegsDropDownState();
}

String dropdownLegs = 'Squats';


String getLegs(){
  return dropdownLegs;
}


class _LegsDropDownState extends State<LegsDropDown> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownLegs,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent, fontSize: 17),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownLegs = newValue!;
        });
      },
      items: <String>[
        'Squats',
        'Leg Press',
        'Romanian Deadlifts',
        'Hamstring Curl',
        'Calf Press'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}