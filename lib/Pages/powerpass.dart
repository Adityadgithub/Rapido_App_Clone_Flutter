import 'package:flutter/material.dart';
void main() {
runApp(PowerPass());
}

class PowerPass extends StatefulWidget {
  const PowerPass({ Key? key }) : super(key: key);
  @override
  State<PowerPass> createState() => _PowerPassState();
}
class _PowerPassState extends State<PowerPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Center(
          child: Text(
        "POWER PASS EMPTY",
        style: TextStyle(
            color: Colors.grey,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      )),
    );
  }
}