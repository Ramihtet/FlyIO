import 'package:flutter/material.dart';


class Bar extends StatelessWidget {
  final double height;

  const Bar({Key key, this.height}) : super(key: key);
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
          height: 700,
        ),
        new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: new Text(
            "FlyIo",
            style: TextStyle(
              fontFamily: 'PermanentMarker',
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