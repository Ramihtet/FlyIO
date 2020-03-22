import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flyio/FlightSearchpage/InputCard.dart';

Future<String> _loadCrosswordAsset() async {
  return await rootBundle.loadString('assets/airports.json');
}

Map decoded;
var wherefromfinal;
Future<String> loadCrossword(String airport) async {
  String jsonCrossword = await _loadCrosswordAsset();
  _parseJsonForCrossword(jsonCrossword,airport);
}
void _parseJsonForCrossword(String jsonString, String airport) {
  decoded = jsonDecode(jsonString);
  wherefromfinal = decoded[airport];

}