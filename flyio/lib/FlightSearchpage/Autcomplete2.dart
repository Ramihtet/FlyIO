import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flyio/FlightSearchpage/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';
import 'package:flyio/FlightSearchpage/Autocomplete.dart';

import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Airline {
  String iata;
  String lon;
  String iso;
  int status;
  String name;
  String continent;
  String type;
  String lat;
  String size;

  Airline({
    this.iata,
    this.lon,
    this.iso,
    this.status,
    this.name,
    this.continent,
    this.type,
    this.lat,
    this.size,
  });

  factory Airline.fromJson(Map<String, dynamic> parsedJson) {
    return Airline(
      iata: parsedJson["iata"],
      lon: parsedJson["lon"],
      iso: parsedJson["iso"],
      status: parsedJson["status"],
      name: parsedJson["name"] as String,
      continent: parsedJson["continent"],
      type: parsedJson["type"],
      lat: parsedJson["lat"],
      size: parsedJson["size"],
    );
  }
}

//void main() => runApp(SearchFlights());
//
//class SearchFlights extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      home: Autocomlete2(
//          title: 'Search for flights page'
//
//      ),
//    );
//  }
//}

class Autocomlete2 extends StatefulWidget {
  Autocomlete2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  AutoCompleteDemoState createState() => AutoCompleteDemoState();
}

//
//class AutoCompleteDemo extends StatefulWidget {
//
//  final String title = "AutoComplete Demo";
//  @override
//  _AutoCompleteDemoState createState() => _AutoCompleteDemoState();
//}

class AutoCompleteDemoState extends State<Autocomlete2> {
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<Airline>> key = new GlobalKey();
  static List<Airline> users = new List<Airline>();
  bool loading = true;

  void getAirlines() async {
    try {
      final response =
      await http.get("https://raw.githubusercontent.com/Ramihtet/airlines/master/working.json");
      if (response.statusCode == 200) {
        users = loadAirlines(response.body);
//        print(users);
        print('Airlines: ${users.length}');
        setState(() {
          loading = false;
        });
      } else {
        print("Error getting users.");
      }
    } catch (e) {
      print("Error getting users.");
    }
  }

  static List<Airline> loadAirlines(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Airline>((json) => Airline.fromJson(json)).toList();
  }

  @override
  void initState() {
    getAirlines();
    super.initState();
  }

  Widget row(Airline user) {
    return Wrap(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          user.name,
          style: TextStyle(fontSize: 16.0),
        ),
//        SizedBox(
//          width: 1.0,
//        ),
//        Text(
//          user.iata,
//        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
//      Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child:
        loading
        ? CircularProgressIndicator()
        :
        searchTextField = AutoCompleteTextField<Airline>(
          key: key,
          clearOnSubmit: false,
          suggestions: users,
          suggestionsAmount: 4,
          controller: wheretocon,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            icon: Icon(Icons.flight_land, color: Colors.blueAccent),
//            contentPadding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
            labelText: "To",
//            hintStyle: TextStyle(color: Colors.black),
          ),
          itemFilter: (item, query) {
//              print(query);
//              print(" ${item.name.toLowerCase().startsWith(query.toLowerCase())} is user : ${item.name} " );
            return item.name
                .toLowerCase()
                .startsWith(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.name.compareTo(b.name);
          },
          itemSubmitted: (item) {
//              print(item.name);
            setState(() {
              searchTextField.textField.controller.text = item.name;
//                print(searchTextField.textField.controller.text);
            });
          },
          itemBuilder: (context, item) {
//              print(item.name);
            // ui for the autocompelete row
            return row(item);
          },
        ),
      );
//        ],
//      ),
//    );
  }
}