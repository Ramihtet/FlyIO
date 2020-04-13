import 'package:flutter/material.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:flyio/Password_reset/Reseter.dart';
import 'package:flyio/main.dart';


class PassWordReset extends StatelessWidget {
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
                      "We Have sent a messege to your email with a code. Please Enter it To reset your password : ",
                      style: TextStyle(fontFamily: 'Anton', fontSize: 20),
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                        controller:CodeCon ,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Enter Code", hasFloatingPlaceholder: true),
                      ),
                    SizedBox(height: 50,),
                    RaisedButton(
                        child: Text("Reset"),
                        color: Colors.blueAccent,
                        onPressed: (){
                          print(CodeCon.text);
                          if(CodeCon.text == Code.toString()) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context) => Reseter())
                            );
                          }
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