import 'package:flutter/material.dart';

class PlateCalcPage extends StatefulWidget {
  static const String id = "plate_calculator_page";

  @override
  _PlateCalcPageState createState() => _PlateCalcPageState();
}

class _PlateCalcPageState extends State<PlateCalcPage> {
  late double bar = 0;
  late double p25 = 0;
  late double p20 = 0;
  late double p15 = 0;
  late double p10 = 0;
  late double p5 = 0;
  late double p205 = 0;
  late double p1025 = 0;
  late int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plate Calculator"),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/plateCalc_screen.webp'),
            //colorFilter: ColorFilter.mode(Colors, BlendMode.color),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            color: Colors.white38,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bar Weight With No Plates Added: ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(),
                          SizedBox(
                            width: 70,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  bar = double.parse(value);
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  suffixText: "kg",
                                  border: OutlineInputBorder(),
                                  filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            child: Text(
                              "Plate Weight",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(),
                          SizedBox(
                            child: Text(
                              "Quantity (each side)",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "25 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p25 = (double.parse(value) * 25 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "20 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p20 = (double.parse(value) * 20 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "15 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p15 = (double.parse(value) * 15 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "10 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p10 = (double.parse(value) * 10 * 2)  + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "5 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p5 = (double.parse(value) * 5 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2.5 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p205 = (double.parse(value) * 2.5 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1.25 kg",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(),
                          SizedBox(
                            width: 45,
                            height: 30,
                            child: TextField(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  p1025 = (double.parse(value) * 1.25 * 2) + bar;
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(), filled: true),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: Material(
                          color: Colors.indigo.shade300,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                          elevation: 2.0,
                          child: MaterialButton(
                            onPressed: () {

                              result = (bar + p25 + p20+ p15 + p10 + p5 + p205 + p1025).round();
                            },
                            child: const Text(
                              'Calculate',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "The bar weighs",
                        style: TextStyle(
                          fontSize: 25
                        ),
                      ),
                      Text(
                      result.toString() + " kg",
                        style: TextStyle(
                          fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
