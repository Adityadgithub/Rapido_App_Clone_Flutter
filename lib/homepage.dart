import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidoo/directions_model.dart';
import 'package:rapidoo/directions_repository.dart';
import 'package:rapidoo/main.dart';

void main() {
  runApp(MapSample());
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  var dd;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                    onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
      )),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 225, 203, 1),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _origin!.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _destination!.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height - 320,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  markers: {
                    if (_origin != null) _origin!,
                    if (_destination != null) _destination!
                  },
                  onLongPress: AddMaker,
                  zoomControlsEnabled: false,
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  polylines: {},
                ),
                if (_info != null)
                  Positioned(
                    top: 20.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: Text(
                        '${_info!.totalDistance}, ${_info!.totalDuration}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 250,
                    left: 430,
                  ),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.white.withOpacity(0.75),
                    child: IconButton(
                      onPressed: _goToOriginalP,
                      icon: Icon(
                        Icons.my_location,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 7, 80, 9),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "06/157, Phase 1, IDA Jeedimetla,",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                  elevation: 2.4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "356, Old Post Office Rd, LB Nagar",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 26, 26, 26)),
            onPressed: () {},
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 3,
                  ),
                  Icon(Icons.directions_bike, color: Colors.yellow),
                  Text(
                    "Ride",
                    style: TextStyle(color: Colors.yellow),
                  )
                ])),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _goToOriginalP() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  void AddMaker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
            markerId: MarkerId("origin"),
            infoWindow: InfoWindow(title: "Origin"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
        _destination = null;
        _info = null;
      });
    } else {
      {
        setState(() {
          _destination = Marker(
              markerId: MarkerId("destination"),
              infoWindow: InfoWindow(title: "Destination"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              position: pos);
        });
      }
    }

    final directions = await DirectionsRepository(dio: dd)
        .getDirections(origin: _origin!.position, destination: pos);
    setState(() {});
  }
}
