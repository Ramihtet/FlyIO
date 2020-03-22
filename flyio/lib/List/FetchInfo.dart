import 'package:http/http.dart' as http;
import 'package:flyio/List/classes.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/List/Page.dart';
import 'package:flyio/Globals.dart';
import 'dart:convert';

Future<Info> fetchInfo(htt) async {
  String url = htt;
  print(url);
  final response =
  await http.get(
      url,
      headers: {
        "Authorization" : "Bearer " + token
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
//    print("ho");
//    print(token);
//    print("hi");
//  print(response.body);
    loading.load = true;
//  if (response.body == null){throw Exception('Failed to load');}

    return Info.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}
//bool loading(){
//  return true;
//}