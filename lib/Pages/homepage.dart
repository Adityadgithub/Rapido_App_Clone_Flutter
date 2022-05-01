import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidoo/Pages/Drawer.dart';
import 'package:rapidoo/googlemap/.env.dart';
import 'package:rapidoo/googlemap/directions_model.dart';
import 'package:rapidoo/googlemap/directions_repository.dart';
import 'package:google_geocoding/google_geocoding.dart';
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

  var address;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DrawerWidget(),
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
                  padding: const EdgeInsets.only(right: 15.0),
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
                        "${address}",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
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

    var googleGeocoding = GoogleGeocoding("Your-Key");
    address = await googleGeocoding.geocoding
        .getReverse(LatLon(19.075983, 72.877655));

    setState(() {});
  }
}
