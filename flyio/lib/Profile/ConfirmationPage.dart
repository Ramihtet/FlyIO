import 'package:flutter/material.dart';
import 'package:flyio/Profile//bar.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: Text(
              "Confirmation",
              style: TextStyle(
                  fontFamily: 'PermanentMarker', color: Colors.white70),
            ),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white70),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Stack(children: <Widget>[
          new Bar(height: 210.0),
          ListView(children: <Widget>[
            new Container(
              height: 135,
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
              decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  borderRadius: BorderRadius.circular(12)),
              height: 300,
              width: 2000,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.white70,
                child: Text(
                  "Your message was sent.\n\n"
                  "Please be patient and we will get back to you ASAP.\n\n"
                  "FlyIO Team",
                  style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 25),
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("FLYIO",
                    style:
                        TextStyle(fontFamily: 'PermanentMarker', fontSize: 28))
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
            )
          ])
        ]));
  }
}
