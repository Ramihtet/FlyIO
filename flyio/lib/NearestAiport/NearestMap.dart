import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyio/NearestAiport/locations_airports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flyio/NearestAiport/functions.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';




class MapsDemo extends StatefulWidget {
  final Position nearest;
  MapsDemo({Key key, this.nearest}) : super();


  final String title = "Maps Demo";

  @override
  MapsDemoState createState() => MapsDemoState();
}

double lat;
double lon;
String iatNear;
class MapsDemoState extends State<MapsDemo> {
  @override
  void initState() {
//    super.initState();
    final Geolocator geolocator = Geolocator()

      ..forceAndroidLocationManager;
     geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
            setState(() {
              iatNear = getClosestAirport(position.longitude, position.latitude);
              lon = double.parse(Locations[getClosestAirport(position.longitude, position.latitude)]["lon"]);
              lat = double.parse(Locations[getClosestAirport(position.longitude,position.latitude)]["lat"]);



            });



      });
     print(lon);




    }
  final Position text;
  MapsDemoState({Position key, this.text}) : super();


  //
  Completer<GoogleMapController> _controller = Completer();

//  static final LatLng _center = LatLng(lon,lat );
  final Set<Marker> _markers = {};
//  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(lat,lon ),
    tilt: 59.440,
    zoom: 10.0,
  );


  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
//    _lastMapPosition = position.target;
  }




  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        appBar: AppBar(
//          title: Text(widget.title),
//          backgroundColor: Colors.blue,
//        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Container(child: Row(
                children: <Widget>[
                  Text(iatNear.toString()),
                  SizedBox(width: 10,),
                  Text(Locations[iatNear]["name"].toString())
                ],
              ),),
            ),
            Flexible(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat,lon),
                  zoom: 15.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
            ),

          ],
        ),
      ),
    );
  }
}