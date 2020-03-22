import 'package:http/http.dart' as http;
import 'package:flyio/HomeScreen/classes.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/HomeScreen/DummyPage.dart';
import 'dart:convert';
Future<Dest> fetchDestinations(country_of_origin) async {
  String url = "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin="+country_of_origin;
  print(url);
  final response =
  await http.get(
      url,
      headers: {
        "Authorization" : "Bearer " +token
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
//    print("ho");
//    print(token);
//    print("hi");
    print(response.body);
    if (response.body == null){throw Exception('Failed to load');}

    return Dest.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}