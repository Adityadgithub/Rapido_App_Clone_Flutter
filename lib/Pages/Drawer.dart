import 'package:flutter/material.dart';

import '../main.dart';

void main() {
  runApp(DrawerWidget());
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 13.0, left: 10),
          child: Column(
            children: [
              Container(
                child: Row(children: [
                  CircleAvatar(
                    minRadius: 20,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "+91 9876543210",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  if (homepageenable == false) {
                    Navigator.pushNamed(context, "HomePage");
                    homepageenable = true;
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  homepageenable = false;
                  Navigator.pushNamed(context, "CovidPage");
                },
                child: Row(
                  children: [
                    Icon(Icons.medication),
                    SizedBox(
                      width: 20,
                    ),
                    Text("COVID 19",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "PaymentPage");
                },
                child: Row(
                  children: [
                    Icon(Icons.payments_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Payments",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "MyRides");
                },
                child: Row(
                  children: [
                    Icon(Icons.time_to_leave),
                    SizedBox(
                      width: 20,
                    ),
                    Text("My Rides",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Invitefrnds");
                },
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Invite Friends",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "PowerPass");
                },
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Power Pass",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Notifications");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Notification",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Insurance");
                },
                child: Row(
                  children: [
                    Icon(Icons.shield),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Insurance",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Settings");
                },
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Support");
                },
                child: Row(
                  children: [
                    Icon(Icons.support),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Support",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
