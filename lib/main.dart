import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidoo/covidpage.dart';
import 'package:rapidoo/homepage.dart';
import 'package:rapidoo/myrides.dart';
import 'package:rapidoo/payment.dart';
import 'package:rapidoo/setting.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.windows) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(MyApp());
}

var homepageenable = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "HomePage": (context) => MapSample(),
        "CovidPage": (context) => covidpage(),
        "PaymentPage": (context) => Payment(),
        "MyRides": (context) => MyridesPage(),
        "Settings": (context) => Settings(),
      },
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}

class Rapioapp extends StatefulWidget {
  const Rapioapp({Key? key}) : super(key: key);
  @override
  State<Rapioapp> createState() => _RapioappState();
}

class _RapioappState extends State<Rapioapp> {
  var submitpressed = false;

  var phonenum;

  TextEditingController textcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellow,
        ),
        body: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  padding: const EdgeInsets.fromLTRB(30, 60, 0, 20),
                  child: CircleAvatar(
                    child: Image(image: AssetImage("assets/holding.jpg")),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27.0, top: 15),
              child: Text(
                submitpressed == true ? "Enter The OTP" : "Enter Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                submitpressed == true
                    ? "We Have sent an OTP to:  ${phonenum}"
                    : "OTP Will be sent to this number",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(38.0),
                child: TextFormField(
                    maxLength: submitpressed == true ? 4 : 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your number";
                      }
                      if (value.length < 10) {
                        return "Enter valid number";
                      }
                      return null;
                    },
                    autocorrect: true,
                    controller: textcontroller,
                    decoration: InputDecoration(
                      labelText:
                          submitpressed == true ? "OTP" : "Enter Phone Number",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ))),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    if (submitpressed == false)
                      Padding(
                        padding: const EdgeInsets.only(right: 75.0),
                        child: Text("By continuing, you agree to the"),
                      ),
                    if (submitpressed == false)
                      Padding(
                        padding: const EdgeInsets.only(left: 160.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("terms"),
                        ),
                      ),
                    if (submitpressed == false)
                      Padding(
                        padding: const EdgeInsets.only(left: 227.0),
                        child: Text("and"),
                      ),
                    if (submitpressed == false)
                      Padding(
                        padding: const EdgeInsets.only(right: 70, top: 40),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Privacy Policy"),
                        ),
                      ),
                    if (submitpressed == false)
                      Padding(
                        padding: const EdgeInsets.only(left: 80, top: 40),
                        child: Text("of Rapido"),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: TextButton(
                        onPressed: () {
                          if (submitpressed == true) {
                            submitpressed = false;
                            homepageenable = true;
                            Navigator.pushNamed(context, "HomePage");
                          }

                          if (_formKey.currentState!.validate() &&
                              (submitpressed == false)) {
                            setState(() {});
                            submitpressed = true;
                            homepageenable = true;
                            phonenum = textcontroller.text;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                    'OTP Sent!',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  backgroundColor: Colors.white,
                                  duration: Duration(seconds: 2)),
                            );
                            textcontroller.clear();
                          }
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            elevation: 5,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width - 150, 50),
                            backgroundColor: Colors.black),
                        child: Text(
                          submitpressed == false ? "SEND OTP" : "VERIFY",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}

class terms extends StatelessWidget {
  const terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text("terms"),
    );
  }
}
