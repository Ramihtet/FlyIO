import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/Buttons.dart';
import 'package:flyio/Guest_snackbar.dart';
import 'package:flyio/InfoScreen/screen.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:flyio/List/Page.dart';
import 'dart:convert';
import 'package:flyio/IATA_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flyio/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stops(),
    );
  }
}
class Stops extends StatefulWidget {
  @override
  Bingo2 createState() => Bingo2();
}

class Bingo2 extends State<Stops> {
  void initState() {
    super.initState();
//    print(stops_dep[0].arrival.iataCode.toString());
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
      new Bar(height: 400.0),
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(30,10,0,0),
                  child: Container(
//                color:Colors.red,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.flight_takeoff,color: Colors.white70,),
                        Text("Departure:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),),
                        SizedBox(width: 80,),
                    !Guestbool?RaisedButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen()));
                          },
                          color: Colors.blue,
                          child:
                          Text("Proceed",style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),),
                        ):Container(),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
//          addAutomaticKeepAlives: true,
//          cacheExtent: 1000,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("Stop number "+(index+1).toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 13,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
//                          color: Colors.blueAccent,
                                          padding: const EdgeInsets.all(8.0),
//                                          color: Colors.blueAccent,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
//                                              "test",
                                                  stops_dep[index].departure.iataCode,
//                                    list_of_flights
//                                        .data_list[index].price.total,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                                    ),

                                                Text(
                                                  iatamain[stops_dep[index].departure.iataCode]["name"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                                    ),
                                              ]))),
                                  Icon(Icons.send,color: Colors.lightBlueAccent,),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
//                                              "test",
                                              stops_dep[index].arrival.iataCode,
                                              style: TextStyle(
                                            fontSize: 14,

                                            fontWeight: FontWeight.bold),
                                                ),

                                            Text(
//                                          "test",
                                              iatamain[stops_dep[index].arrival.iataCode]["name"],
                                              textAlign: TextAlign.center,

//                                    snapshot1.data.data[0].businessName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                                ),
                                          ])),
                                ],
                              ),
                              Divider(color: Colors.black,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: Text(stops_dep[index].duration),),
                              )
                            ],
                          ),
                        ),

                        //how many cards we want to display
                      );
                    },
                    itemCount: stops_dep.length,
//                  itemCount: 10,
                  ),
                ),
                trip?Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,10,0,0),
                      child: Container(
//                color:Colors.red,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.flight_land,color: Colors.white70,),
                            Text("Arrival:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
//          addAutomaticKeepAlives: true,
//          cacheExtent: 1000,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text("Stop number "+(index+1).toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 13,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
//                          color: Colors.blueAccent,
                                              padding: const EdgeInsets.all(8.0),
//                                          color: Colors.blueAccent,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(stop_arr[index].departure.iataCode,
//                                    list_of_flights
//                                        .data_list[index].price.total,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold),
                                                    ),

                                                    Text(iatamain[stop_arr[index].departure.iataCode]["name"],
                                                      textAlign: TextAlign.center,

//                                    snapshot1.data.data[0].businessName,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ]))),
                                      Icon(Icons.send,color: Colors.lightBlueAccent,),
                                      Expanded(
                                          child: Container(
//                          color: Colors.blueAccent,
                                              padding: const EdgeInsets.all(8.0),
//                                          color: Colors.blueAccent,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(stop_arr[index].arrival.iataCode,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold),
                                                    ),

                                                    Text(iatamain[stop_arr[index].arrival.iataCode]["name"],
                                                      textAlign: TextAlign.center,

//                                    snapshot1.data.data[0].businessName,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ]))),
                                    ],
                                  ),
                                  Divider(color: Colors.black,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(child: Text(stops_dep[index].duration),),
                                  )
                                ],
                              ),
                            ),

                            //how many cards we want to display
                          );
                        },
                        itemCount: stop_arr.length,
//                  itemCount: 10,
                      ),
                    ),
                  ],
                ):Container()




              ],
            ),
          ),
        ],
      )
    ]));
  }
}
