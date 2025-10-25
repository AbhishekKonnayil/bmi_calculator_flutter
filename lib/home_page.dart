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

  final BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.grey.shade900,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: const [
      BoxShadow(color: Colors.black38, offset: Offset(5, 5), blurRadius: 10),
      BoxShadow(color: Colors.white12, offset: Offset(-5, -5), blurRadius: 10),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bmiValue == null ? buildInputUi() : buildOutputUi());
  }

  Widget buildInputUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          decoration: boxDecoration,
          child: TextField(
            cursorColor: Colors.white60,
            style: const TextStyle(color: Colors.white70),
            controller: heightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(color: Colors.white24),
              hintText: 'Height in cm',
            ),
          ),
        ),
        const SizedBox(height: 50),

        Container(
          height: 50,
          decoration: boxDecoration,
          child: TextField(
            cursorColor: Colors.white60,
            style: const TextStyle(color: Colors.white70),
            controller: weightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(color: Colors.white24),
              hintText: 'Weight in kg',
            ),
          ),
        ),

        const SizedBox(height: 50),

        Container(
          decoration: boxDecoration,
          child: MaterialButton(
            height: 60,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            minWidth: double.infinity,
            color: Colors.greenAccent,
            onPressed: calculateBMI,
            child: Text(
              'Calculate BMI',
              style: TextStyle(
                color: Colors.green.shade200,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOutputUi() {
    return Column(
      children: [
        Text("$bmiValue"),
        MaterialButton(
          color: Colors.greenAccent,
          onPressed: checkAnother,
          child: Text("Check Another"),
        ),
      ],
    );
  }

  void calculateBMI() {
    //BMI Formula: weight (kg) / [height (m)]^2

    double h = double.tryParse(heightController.text)! / 100;
    double w = double.tryParse(weightController.text)!;
    setState(() {
      bmiValue = w / (h * h);
    });

    print("BMI : $bmiValue");
  }

  void checkAnother() {
    setState(() {
      heightController.text = "";
      weightController.text = "";
      bmiValue = null;
    });
  }
}
