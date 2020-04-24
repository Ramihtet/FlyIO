import 'package:http/http.dart' as http;
import 'package:flyio/List/classes.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/List/Page.dart';
import 'package:flyio/Globals.dart';
import 'dart:convert';

class mySortingObject {
  List<Datum> data_list;

  // Constructor, with syntactic sugar for assignment to members.
  mySortingObject(this.data_list) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  mySortingObject.unlaunched(List<Datum> data_list) : this(data_list);

}


mySortingObject list_of_flight = mySortingObject(null);

mySortingObject sorted_price  = mySortingObject(null);
mySortingObject sorted_dep  = mySortingObject(null);
mySortingObject sorted_duration  = mySortingObject(null);

Future<Info> fetchInfo(htt) async {
  String url = htt;
//  print(url);
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
//    loading.load = true;
//  if (response.body == null){throw Exception('Failed to load');}
    Info ii = Info.fromJson(json.decode(response.body));
    List<Datum> data= ii.data;
    list_of_flight.data_list = new List<Datum>.from(data);

    sorted_price.data_list =new List<Datum>.from(data);
    sorted_dep.data_list = new List<Datum>.from(data);
    sorted_duration.data_list = new List<Datum>.from(data);
    sorted_dep.data_list.sort((a, b) => a.itineraries[0].segments[0].departure.at.compareTo(b.itineraries[0].segments[0].departure.at));

    sorted_price.data_list.sort((a, b) => double.parse(a.price.total).compareTo(double.parse(b.price.total)));

    sorted_duration.data_list.sort((a, b) => a.itineraries[0].duration.compareTo(b.itineraries[0].duration));
//    for(var i = 0; i < sorted_duration.data_list.length; i++){
//      print(sorted_duration.data_list[i].itineraries[0].duration);
//    }
    return Info.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load');
  }
}
Future<Map> fetchInfo2(htt) async {
  String url = htt;
//  print(url);
  final response =
  await http.get(
      url,
      headers: {
        "Authorization" : "Bearer " + token
      });
  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    return parsedJson;



  } else {
    throw Exception('Failed to load');
  }
}
//void sortingDur(mySortingObject dataa){
//
//  dataa.data_list.sort((a, b) => a.itineraries[0].duration.compareTo(b.itineraries[0].duration));
//
//}
//void sortingP(mySortingObject dataa){
//
//
//  dataa.data_list.sort((a, b) => double.parse(a.price.total).compareTo(double.parse(b.price.total)));
//  for(var i = 0; i < sorted_price.data_list.length; i++){
//    print(sorted_price.data_list[i].price.total);
//  }
//
//}
//void sortingDep(mySortingObject dataa){
//
//}