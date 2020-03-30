import 'package:flyio/HomeScreen/classes.dart';
import 'package:http/http.dart' as http;
import 'package:flyio/List/classes.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/List/Page.dart';
import 'dart:convert';
Future<Img> fetchImg(htt) async {
  String url = htt;
//  print(url);
  final response =
  await http.get(url,);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
//    print("ho");
//    print(token);
//    print("hi");
//    print(response.body);
    if (response.body == null){throw Exception('Failed to load');}

    return Img.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}