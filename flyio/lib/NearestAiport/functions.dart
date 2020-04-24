import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flyio/NearestAiport/locations_airports.dart';
import 'dart:math';



final Geolocator geolocator = Geolocator()
  ..forceAndroidLocationManager;


  String getClosestAirport(double lon,double lat) {
    dynamic long;
    dynamic lati;
    dynamic distance;
    dynamic mindistance = 100000.00;
    dynamic minLocationIATA;

        var mine = Position(longitude: lon,latitude: lat);


        Locations.forEach((k, v) {
          long = pow(double.parse(v["lon"]) - mine.longitude ,2);
          lati = pow(double.parse(v["lat"])- mine.latitude,2);
          distance = sqrt(long + lati);
          if (mindistance > distance) {
            mindistance = distance;
            minLocationIATA = k;
//            print(k);
          }
        });
        return minLocationIATA;




  }




















