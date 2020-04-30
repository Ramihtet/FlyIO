import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';
import 'package:flyio/List/Page.dart';


class Bar extends StatelessWidget {
//  final double height;

  const Bar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, const Color(0x5685F4FF)],
            ),
          ),
          height: 1000,

        ),
        new AppBar(
//          leading: new IconButton(
//            icon: new Icon(Icons.arrow_back, color: Colors.black),
//            onPressed: () {
//              Navigator.push(context,
//                MaterialPageRoute(
//                    builder: (context) => Api4())
//            );
//              },
//          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: new Text(
            "FlyIo",
            style: TextStyle(
              fontFamily: 'Anton',
              fontSize: 30,
              color: Colors.white70,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ],
    );
  }
}