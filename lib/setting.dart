import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow, actions: [
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("General"),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Profile",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("Enter Mobile Number",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                SizedBox(height: 5),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 25,
                              ),
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Favorites",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("Manage favorite location",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                SizedBox(height: 5),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset(
                                "assets/preference.png",
                                fit: BoxFit.fill,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Preference",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("Manage prefrences",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                SizedBox(height: 5),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset(
                                "assets/googletrans.png",
                                fit: BoxFit.fill,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("App Language",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("English",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                SizedBox(height: 5),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset(
                                "assets/shortcut1.png",
                                fit: BoxFit.fill,
                              ),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("App Shortcuts",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("Create shorcuts on home launcher",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Other"),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.info_outline,
                                size: 35,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("About",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("5.5.27",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.workspace_premium_outlined,
                                size: 35,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Subscribe to Beta",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text("Get early access to latest features",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.logout,
                                size: 35,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Logout",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
