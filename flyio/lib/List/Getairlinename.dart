import 'package:flyio/List/Getairlineclasses.dart';
import 'package:flyio/List/Page.dart';
import 'package:http/http.dart' as http;
import 'package:flyio/List/classes.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'dart:convert';
import 'package:flyio/List/Getairlineclasses.dart';

main(){
  Getname("");
}
Airline air;
String getairlinehttp(String iata){
  return "https://test.api.amadeus.com/v1/reference-data/airlines?airlineCodes="+iata;
}
Future<Airline> Getname(htt) async {
  String url = htt;
//  print(url);
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
//    print(response.body);
    return Airline.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}

Getname1 (String link){
  return Getname(link);




}