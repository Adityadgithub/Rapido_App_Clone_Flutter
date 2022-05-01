import 'package:flutter/material.dart';

class MyridesPage extends StatefulWidget {
  const MyridesPage({Key? key}) : super(key: key);

  @override
  State<MyridesPage> createState() => _MyridesPageState();
}

class _MyridesPageState extends State<MyridesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.3,
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Text(
                  "Previous Rides",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          RideCards(),
        ],
      ),
    );
  }
}

class RideCards extends StatelessWidget {
  const RideCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bike Taxi, 9 days ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("Cancelled",
                            style: TextStyle(color: Colors.red, fontSize: 17))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "- 0",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Cash",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(height: 7),
            Divider(color: Colors.black),
            SizedBox(height: 5),
            Column(children: [
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 20),
                  SizedBox(width: 15),
                  Text("Bandra West")
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.red, size: 20),
                  SizedBox(width: 15),
                  Text("Bandra East")
                ],
              )
            ]),
          ]),
        ),
      )),
    );
  }
}
