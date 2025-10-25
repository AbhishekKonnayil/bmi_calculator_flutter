import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? bmiValue;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildInputUi());
  }

  Widget buildInputUi() {
    return Column(
      children: [
        TextField(
          controller: heightController,
          decoration: InputDecoration(hintText: 'Height in cm'),
        ),
        TextField(
          controller: weightController,
          decoration: InputDecoration(hintText: 'Weight in kg'),
        ),
        MaterialButton(
          color: Colors.greenAccent,
          onPressed: calculateBMI,
          child: Text('Calculate BMI'),
        ),
      ],
    );
  }


  void calculateBMI() {}
}
