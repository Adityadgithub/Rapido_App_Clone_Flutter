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
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as l;

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
  Position? position;

  late final CameraPosition? kGooglePlex = CameraPosition(
    target: LatLng(position?.latitude ?? 37.42796133580664,
        position?.longitude ?? -122.085749655962),
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

  var startaddress;
  var startadresssolved;
  var startplaceMark;
  var startplacename;
  var startsubLocality;
  var startlocality;
  var startadministrativeArea;
  var startpostalCode;
  var startcountry;
  var startplaceaddress;

  var endaddress;
  var endadresssolved;
  var endplaceMark;
  var endplacename;
  var endsubLocality;
  var endlocality;
  var endadministrativeArea;
  var endpostalCode;
  var endcountry;
  var endplaceaddress;

  bool located = false;

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
            height: MediaQuery.of(context).size.shortestSide,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                GoogleMap(
                  markers: {
                    if (_origin != null) _origin!,
                    if (_destination != null) _destination!
                  },
                  onLongPress: AddMaker,
                  zoomControlsEnabled: false,
                  mapType: MapType.hybrid,
                  initialCameraPosition: kGooglePlex!,
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
                  padding: const EdgeInsets.only(top: 20.0, right: 15),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.white.withOpacity(0.75),
                    child: IconButton(
                      onPressed: getLocation,
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
          if (located == true)
            Container(
                height: 90,
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
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
                          "${startplaceaddress}",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )
                      ],
                    ))),
          if (located == true)
            Container(
                height: 90,
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
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
                          "${endplaceaddress}",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )
                      ],
                    ))),
          if (located == true)
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 26, 26, 26)),
              onPressed: () {
              },
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
          if (located == false)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 130.0,
              ),
              child: Text(
                "Choose Your Start Location from the Map to Get Started!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _goToOriginalP() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex!));
  }

  void getLocation() async {
    final GoogleMapController controller = await _controller.future;
    l.Location currentLocation = l.Location();
    Set<Marker> _marker = {};
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((l.LocationData loc) {
      controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _marker.add(Marker(
          markerId: MarkerId("Home"),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          visible: true,
          icon: BitmapDescriptor.defaultMarker,
        ));
      });
    });

    void initState() {
      super.initState();
      setState(() {
        getLocation();
      });
    }
  }

  void AddMaker(LatLng pos) async {
    located = true;
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {});
      _origin = Marker(
          markerId: MarkerId("origin"),
          infoWindow: InfoWindow(title: "Origin"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos);
      _destination = null;
      _info = null;

      startaddress = await placemarkFromCoordinates(
        _origin!.position.latitude,
        _origin!.position.longitude,
      );
      startplaceMark = startaddress[0];
      startplacename = startplaceMark.name;
      startsubLocality = startplaceMark.subLocality;
      startlocality = startplaceMark.locality;
      startadministrativeArea = startplaceMark.administrativeArea;
      startpostalCode = startplaceMark.postalCode;
      startcountry = startplaceMark.country;
      startplaceaddress =
          "${startplacename} ${startsubLocality}, ${startlocality}, ${startadministrativeArea} ${startpostalCode}, ${startcountry}";
    } else {

        setState(() {
          _destination = Marker(
              markerId: MarkerId("destination"),
              infoWindow: InfoWindow(title: "Destination"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              position: pos);
        });

        endaddress = await placemarkFromCoordinates(
          _destination!.position.latitude,
          _destination!.position.longitude,
        );
        endplaceMark = endaddress[0];
        endplacename = endplaceMark.name;
        endsubLocality = endplaceMark.subLocality;
        endlocality = endplaceMark.locality;
        endadministrativeArea = endplaceMark.administrativeArea;
        endpostalCode = endplaceMark.postalCode;
        endcountry = endplaceMark.country;
        endplaceaddress =
            "${endplacename} ${endsubLocality}, ${endlocality}, ${endadministrativeArea} ${endpostalCode}, ${endcountry}";
      }


  }
}
