import 'dart:convert';
//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/Buttons.dart';
import 'package:flyio/FlightSearchpage/HomePage.dart';
import 'package:flyio/main.dart';

import 'package:flyio/FlightSearchpage/InputCard.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flyio/FlightSearchpage/LoadingScreen.dart';
import 'package:flyio/InfoScreen/screen.dart';
import 'package:flyio/List/Filter.dart';
import 'package:flyio/List/FetchInfo.dart';
import 'package:flyio/List/Getairlineclasses.dart' as g;
import 'package:flyio/List/Getairlinename.dart';
import 'package:flyio/List/classes.dart';
import 'package:flyio/Flight_stops/stop_page.dart';
import 'package:flyio/Globals.dart';
import 'package:flyio/List/sorted_by_price.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
//import 'package:main/Loading.dart';

import 'package:http/http.dart' as http;

//void main() => runApp(Api4());

String priceC;
String durationC;
String companyC;
String flightnumberC;
String iatacode;
List<Segment> stops_dep ;
List<Segment> stop_arr;
var CurrentList = list_of_flight;
var hello = fetchInfo2(httpp);


class Api4 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Api(title: 'Flutter cards Page'),
    );
  }
}

class Api extends StatefulWidget {
  Api({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Api createState() => _Api();
}

class _Api extends State<Api> {
  Map a = {"meta":{"count":1}};
  @override
  void initState() {

    super.initState();
    fetchInfo2(httpp).then((value){
      setState(() {
        a = value;
        print(a);
      });
    });
    RenderErrorBox.backgroundColor = Colors.transparent;
    RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);

  }
  @override
  Widget build(BuildContext context) {
    return
//      loading.load
//        ? CircularProgressIndicator()
//        :
      Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              title: Text('Flights',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              actions: <Widget>[
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Filter.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )
              ],
//              leading: new IconButton(
//                icon: new Icon(Icons.arrow_back, color: Colors.black),
//                onPressed: () {
//                  Navigator.pop(context);
//                })
          ),
          body: Center(
              child: Screen(
                  CurrentList)
          )

      );
  }

  Widget Screen(mySortingObject list_of_flights) {
    return FutureBuilder<Info>(
        future: futureInfo,
        builder: (context, snapshot)
    {
//                      print(snapshot.data);

      if(a["meta"]["count"]==0){
            return Container(
              child: Text("There are no available flights"),
            );
          }
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
//      if(a["meta"]["count"]==0 && snapshot.hasData){
//        return Container(
//          child: Text("There are no available flights"),
//        );
//      }
      else {

//        else {
          return new ListView.builder(
            addAutomaticKeepAlives: true,
            cacheExtent: 10000,
            itemBuilder: (context, index) {
              return FutureBuilder<g.Airline>(
                future: Getname(getairlinehttp(list_of_flights
                    .data_list[index]
                    .itineraries[0]
                    .segments[0]
                    .carrierCode)),
                builder: (context, snapshot1) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        stops_dep = list_of_flights.data_list[index]
                            .itineraries[0].segments;

                        if (trip) {
                          stop_arr = list_of_flights.data_list[index]
                              .itineraries[1].segments;
                        }


                        priceC = list_of_flights.data_list[index].price.total;
                        durationC = list_of_flights
                            .data_list[index].itineraries[0].duration;
                        companyC = list_of_flights.data_list[index]
                            .itineraries[0].segments[0].carrierCode;

                        flightnumberC = list_of_flights.data_list[index]
                            .itineraries[0].segments[0].carrierCode +
                            " " +
                            list_of_flights.data_list[index].itineraries[0]
                                .segments[0].number;
                        iatacode = snapshot1.data.data[0].iataCode;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Stops()));
                    },
                    child: new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 160,
                              height: 100,
//                                        color: Colors.blueAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  'https://daisycon.io/images/airline/?width=300&height=150&color=ffffff&iata=' +
                                      snapshot1.data.data[0].iataCode,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
//                                          color: Colors.blueAccent,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      list_of_flights
                                          .data_list[index].price.total,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      (list_of_flights.data_list[index]
                                          .itineraries[0].duration)
                                          .replaceAll(RegExp('P'), '')
                                          .replaceAll(RegExp('T'), '')
                                          .replaceAll(RegExp('H'), ' hours ')
                                          .replaceAll(
                                          RegExp('M'), ' minutes'),
                                      style: TextStyle(
                                          color: Colors.blue.shade600),
                                    ),
                                    Text(
                                      snapshot1.data.data[0].businessName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      list_of_flights
                                          .data_list[index]
                                          .travelerPricings[0]
                                          .fareDetailsBySegment[0]
                                          .cabin,
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                //how many cards we want to display
              );
            },
            itemCount: list_of_flights.data_list.length,
//                  itemCount: 10,
          );
//        }

    }
        });
  }

  void choiceAction(String choice) {
    print(choice);

    if (choice == 'By Price') {

      setState(() {
        CurrentList = sorted_price;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SplashScreenPage()));
      });

    } else if (choice == "By Duration") {
//      print("hi");
//      for(var i = 0; i < sorted_duration.data_list.length; i++){
//        print(sorted_duration.data_list[i].itineraries[0].duration);
//      }
//      print("hello");

      setState(() {
        CurrentList = sorted_duration;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SplashScreenPage()));
      });



    }else if (choice == "By Departure Time") {
//      print("hi");
//      for(var i = 0; i < sorted_duration.data_list.length; i++){
//        print(sorted_duration.data_list[i].itineraries[0].duration);
//      }
//      print("hello");

      setState(() {
        CurrentList = sorted_dep;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SplashScreenPage()));
      });



    }
  }
}
