import 'package:flutter/material.dart';
import 'package:flyio/Profile/bar.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
          new Bar(height: 210.0),
          new ListView(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                          border: Border.all(width: 5),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                              "https://i.imgur.com/jLB9DY4.png",
                            ),
                          ))),
                  new Text(
                    "John Cena",
                    textScaleFactor: 2.5,
                    style: TextStyle(fontFamily: 'PermanentMarker',color: Colors.black),
                  ),
                  new Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 45,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                    child: new Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3), borderRadius: BorderRadius.circular(12)),
                      width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "   Personal information:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'PermanentMarker'),
                          ),
                          Row(children: <Widget>[
                            Icon(Icons.account_circle,color: Colors.grey.shade700,),
                            Text("  Full Name: ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )
                            ),
                            Text(" John Mostafa Cena",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ]),
                          Row(children: <Widget>[
                            Icon(Icons.email,color: Colors.grey.shade700,),
                            Text("  Email: " ,
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )
                            ),
                            Text("youCantSeeMe@gmail.com",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ]),
                          Row(children: <Widget>[
                            Icon(Icons.outlined_flag,color: Colors.grey.shade700,),
                            Text(
                                "  Country of Origin: ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )
                            ),
                            Text("United States of America",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                  new Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 45,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                    child: new Container(
                      decoration: BoxDecoration(border: Border.all(width: 3),borderRadius: BorderRadius.circular(12)),
//                  color: Colors.black12,
                      width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "   Flight information:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'PermanentMarker'),
                          ),
                          Row(children: <Widget>[
                            Icon(Icons.check_circle_outline,color: Colors.grey.shade700,),
                            Text("  Flights Taken: ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )
                            ),
                            Text("31",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ]),
                          Row(children: <Widget>[
                            Icon(Icons.airplanemode_active,color: Colors.grey.shade700,),
                            Text("  Upcoming Flights:  ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )),
                            Text("5",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ]),
                          Row(children: <Widget>[
                            Icon(Icons.airplanemode_inactive,color: Colors.grey.shade700,),
                            Text("  Flights Cancelled: ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                )),
                            Text("2",
                                style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Colors.grey.shade700
                                )
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Sent to settings page");
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 45,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                      child: new Container(
                        decoration: BoxDecoration(border: Border.all(width: 3),borderRadius: BorderRadius.circular(12)),
//                    color: Colors.black12,
                        width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                        Icon(Icons.settings,color: Colors.grey.shade700,),
                                        Text("  Settings",
                                            style: TextStyle(
                                              fontFamily: 'PermanentMarker',
                                            ))
                                      ]
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14)
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      print("Sent to support website");
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 45,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                      child: new Container(
                        decoration: BoxDecoration(border: Border.all(width: 3),borderRadius: BorderRadius.circular(12)),
//                    color: Colors.black12,
                        width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                        Icon(Icons.headset,color: Colors.grey.shade700,),
                                        Text("  Contact us",
                                            style: TextStyle(
                                              fontFamily: 'PermanentMarker',
                                            ))
                                      ]
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14)
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      print("Sent to Terms & Conditions");
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 45,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                      child: new Container(
                        decoration: BoxDecoration(border: Border.all(width: 3),borderRadius: BorderRadius.circular(12)),
//                    color: Colors.black12,
                        width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                        Icon(Icons.description,color: Colors.grey.shade700,),
                                        Text("  Terms And Conditions",
                                            style: TextStyle(
                                              fontFamily: 'PermanentMarker',
                                            ))
                                      ]
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14)
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Sent to Privacy Policy");
                    },
                    child: new Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 45,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                      child: new Container(
                        decoration: BoxDecoration(border: Border.all(width: 3),borderRadius: BorderRadius.circular(12)),
//                    color: Colors.black12,
                        width: 2000,
//                    padding: new EdgeInsets.fromLTRB(150, 100, 150, 240),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                      children: <Widget>[
                                        Icon(Icons.lock,color: Colors.grey.shade700,),
                                        Text("  Privacy Policy",
                                            style: TextStyle(
                                              fontFamily: 'PermanentMarker',
                                            ))
                                      ]
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 14)
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
//              Container(
//                width: 350,
//                color: Colors.black12,
//                child: new ListTile(
//                  dense: true,
//                    contentPadding:
//                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//                    leading: Container(
//                      padding: EdgeInsets.only(right: 12.0),
//                      decoration: new BoxDecoration(
//                          border: new Border(
//                              right: new BorderSide(
//                                  width: 1.0, color: Colors.white24))),
//                      child: Icon(Icons.headset, color: Colors.white),
//                    ),
//                    title: Text(
//                      "Contact us",
//                      style: TextStyle(
//                          color: Colors.white, fontWeight: FontWeight.bold),
//                    ),
//                    trailing: Icon(Icons.keyboard_arrow_right,
//                        color: Colors.white, size: 30.0)
//                ),
//              ),
                  new RaisedButton(
                    color: Color(0xffFF1744),
                    onPressed: null,
                    child: Text('Sign Out',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: 'PermanentMarker')),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("FLYIO",
                          style: TextStyle(
                              fontFamily: 'PermanentMarker', fontSize: 28))
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("© Copyright 2020 Airline_Reservation_1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("All rights reserved.",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              )
            ],
          )
        ]));
  }
}
