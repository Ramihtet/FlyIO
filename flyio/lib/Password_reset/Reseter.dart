import 'package:flutter/material.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flyio/main.dart';

class Reseter extends StatelessWidget {
  @override
  final CodeCon = TextEditingController();

  Widget build(BuildContext context) {
    return new Scaffold(

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
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Enter You new Password : ",
                      style: TextStyle(fontFamily: 'Anton', fontSize: 20),
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      controller:CodeCon ,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Enter Code", hasFloatingPlaceholder: true),
                    ),
                    SizedBox(height: 100,),
                    RaisedButton(
                        child: Text("Reset"),
                        color: Colors.blueAccent,
                        onPressed: (){
                          Firestore.instance.collection("Users").document(Email_Change).updateData(
                              {
                                "Password":CodeCon.text,
                              });
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())
                          );

                        })
                  ],
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("FLYIO",
                    style:
                    TextStyle(fontFamily: 'Anton', fontSize: 28))
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