import 'package:flutter/material.dart';

void main() {
  runApp(Invitefrnds());
}

class Invitefrnds extends StatefulWidget {
  const Invitefrnds({Key? key}) : super(key: key);
  @override
  State<Invitefrnds> createState() => _InvitefrndsState();
}

class _InvitefrndsState extends State<Invitefrnds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.yellow, actions: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.question_mark,
            color: Colors.yellow,
          ),
        ),
        SizedBox(
          width: 13,
        )
      ]),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 126, 205, 173),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Invite friends and get rewards",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      child: SelectableText(
                        'fvdewd',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.copy,
                          color: Colors.white,
                        ))
                  ],
                ),
                Image(image: AssetImage('assets/refernearn.png')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "How to refer friends?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            child: CircleAvatar(
                              minRadius: 20,
                              child: Text(
                                "1",
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Share your Referral Code",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('''Invite your friends via Whatsapp,
Facebook or any other channel.''',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95))),
                          ],
                        ),
                      ],
                    )),
                SizedBox(height: 25),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            child: CircleAvatar(
                              minRadius: 20,
                              child: Text(
                                "2",
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your friend register with us",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('''Your friend should register with us
using your referral code.''',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95))),
                          ],
                        ),
                      ],
                    )),
                SizedBox(height: 25),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            child: CircleAvatar(
                              minRadius: 20,
                              child: Text(
                                "3",
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Collect your Coins",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('''Once the process is verified
you will get your coins!''',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95))),
                          ],
                        ),
                      ],
                    ))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
