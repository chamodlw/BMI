import 'dart:ffi';

import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  double weight = 60.0;
  late double bmi = bmicalculater(height: height, weight: weight);
  String output = "BMI_state";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Male");
                  },
                  child: Container(
                    width: 165,
                    height: 200,
                    decoration: BoxDecoration(
                      color: kcolor2.withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: const [
                      Icon(
                        Icons.male,
                        size: 120,
                      ),
                      Text(
                        "Male",
                        style: kText1,
                      ),
                    ]),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 165,
                  height: 200,
                  decoration: BoxDecoration(
                    color: kcolor2.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Icon(
                      Icons.female,
                      size: 120,
                    ),
                    Text(
                      "FeMale",
                      style: kText1,
                    ),
                  ]),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text("Height", style: kText1),
                    Text("$height", style: kText2),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (height > 45) {
                                height--;
                                bmi = bmicalculater(
                                    height: height, weight: weight);
                                output = bmioutput(bmi: bmi, output: output);
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (height < 240) {
                                height++;
                                bmi = bmicalculater(
                                    height: height, weight: weight);
                                output = bmioutput(bmi: bmi, output: output);
                              }
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    )
                  ]),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text("Weight", style: kText1),
                    Text("$weight", style: kText2),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight > 2) {
                                weight = weight - 0.5;
                                bmi = bmicalculater(
                                    height: height, weight: weight);
                                output = bmioutput(bmi: bmi, output: output);
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            size: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight < 200) {
                                weight = weight + 0.5;
                                bmi = bmicalculater(
                                    height: height, weight: weight);
                                output = bmioutput(bmi: bmi, output: output);
                              }
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  "BMI",
                  style: kText1,
                ),
                Text(
                  "${bmi.toStringAsFixed(2)}",
                  style: kText2.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(output,
                    style: kText1.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

double bmicalculater({required int height, required weight}) {
  return (weight / (height * height)) * 10000;
}

String bmioutput({required double bmi, required String output}) {
  if (bmi < 18.5) {
    output = "Weight_low";
  }
  if (18.5 <= bmi && bmi < 25) {
    output = "BMI_ok";
  }
  if (bmi >= 25) {
    output = "hetght_low";
  }
  return (output);
}
