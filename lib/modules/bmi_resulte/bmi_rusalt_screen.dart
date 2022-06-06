import 'package:flutter/material.dart';

class BmiRusaltScreen extends StatelessWidget {
  const BmiRusaltScreen({
    Key? key,
    required this.resulte,
    required this.isMale,
    required this.age,
  }) : super(key: key);
  final int resulte;
  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi rusalt'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Gender: ${isMale ? 'Male' : 'Fmale'}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rusalt: $resulte',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Age: $age',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
