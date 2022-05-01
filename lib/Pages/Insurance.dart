import 'package:flutter/material.dart';

void main() {
  runApp(Insurance());
}

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);
  @override
  State<Insurance> createState() => InsuranceState();
}

class InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Center(
          child: Text(
        "BUY INSURANCE",
        style: TextStyle(
            color: Colors.grey,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      )),
    );
  }
}
