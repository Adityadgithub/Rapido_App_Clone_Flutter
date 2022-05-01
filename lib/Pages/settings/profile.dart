import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: Color.fromARGB(255, 115, 195, 105),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65.0, left: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/pic.jpg"),
                  radius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75.0, left: 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thomas C. Mapother",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last vist 01/05/2022",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 10, wordSpacing: 2),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50),
            child: Column(
              children: [
                Container(
                    // alignment: Alignment.centerLeft,
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            "YOUR EMAIL",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      initialValue: "maysasha@gmail.com",
                    )
                  ],
                )),
                Container(
                    // alignment: Alignment.centerLeft,
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            "YOUR PASSWORD",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      obscureText: true,
                      initialValue: "typeyourpass",
                    )
                  ],
                )),
                Container(
                    // alignment: Alignment.centerLeft,
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            "YOUR PHONE",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      initialValue: "+91 7869257329",
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
