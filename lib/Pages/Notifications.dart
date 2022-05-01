import 'package:flutter/material.dart';

void main() {
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Center(
          child: Text(
        "NO NOTIFICATIONS",
        style: TextStyle(
            color: Colors.grey,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      )),
    );
  }
}
