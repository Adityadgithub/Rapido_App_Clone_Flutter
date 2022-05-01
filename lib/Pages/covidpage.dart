import 'package:flutter/material.dart';

class covidpage extends StatefulWidget {
  const covidpage({Key? key}) : super(key: key);

  @override
  State<covidpage> createState() => _covidpageState();
}

class _covidpageState extends State<covidpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellow,
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "Your Safety Matters",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Image(image: AssetImage('assets/Vacine.png')),
                
                
                Container(
                  height: 40,
                  width: 150,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.yellow),
                      onPressed: () {},
                      child: Text(
                        "BOOK VACCINE",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ]),
        ));
  }
}
