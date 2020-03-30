import 'package:flyio/Profile/ConfirmationPage.dart';
import 'package:flutter/material.dart';
import 'package:flyio/Profile/bar.dart';
import 'package:flyio/Profile/SendEmail.dart';

class ContactUs extends StatelessWidget {
  TextEditingController subjectCon = new TextEditingController();
  TextEditingController messegeToBeSentCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: Text(
              "Contact Us",
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
            Card(
              child: TextFormField(
                  controller: subjectCon,
                  decoration: InputDecoration(
                      labelText: "Subject",
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0)),
                  style: TextStyle(fontFamily: 'PermanentMarker'),

              ),
            ),
            Container(
              height: 300,
              child: Card(
                child: TextFormField(
                  controller: messegeToBeSentCon,
                  scrollPadding: const EdgeInsets.symmetric(vertical: 125.0),
                  style: TextStyle(fontFamily: 'PermanentMarker'),
                  maxLines: null,
                    decoration: InputDecoration(
                        labelText: "Enter Your Message here",
                    ),
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(fontFamily: 'PermanentMarker',color: Colors.black),
              ),
              color: Colors.white,
              onPressed: () => [
                sendthemessage(subjectCon.text, messegeToBeSentCon.text),
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConfirmationPage()))]
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
          ]),
        ]));
  }
}
