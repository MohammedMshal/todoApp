import 'dart:math';

import 'package:flutter/material.dart';
import 'package:udimy_abdalla_mansour/shared/components/components.dart';

import '../bmi_resulte/bmi_rusalt_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: isMale
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: const [
                        Expanded(
                          child: Image(
                            image: AssetImage('asset/images/male.png'),
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: !isMale
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: const [
                        Expanded(
                          child: Image(
                            image: AssetImage('asset/images/Female.png'),
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        Expanded(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hight',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${height.round()}',
                    style: const TextStyle(fontSize: 80, color: Colors.white),
                  ),
                  const Text(
                    'cm',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Slider(
                  value: height,
                  max: 220,
                  min: 80,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  })
            ],
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                        Text(
                          '$weight',
                          style: const TextStyle(
                              fontSize: 80, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'heghttageMince',
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'heighttagePluse',
                              mini: true,
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 29),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                        Text(
                          '$age',
                          style: const TextStyle(
                              fontSize: 80, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              mini: true,
                              heroTag: 'agetageMince',
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              heroTag: 'agetagePluse',
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        defaultButton(
          text: 'Calculator',
          onPressed: () {
            double resulte = weight / pow(height / 100, 2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => BmiRusaltScreen(
                  age: age,
                  isMale: isMale,
                  resulte: resulte.round(),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
