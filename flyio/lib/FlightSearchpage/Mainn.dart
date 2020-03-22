import 'package:flyio/FlightSearchpage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyio/FlightSearchpage/Bar.dart';
import 'package:flyio/FlightSearchpage/Buttons.dart';
import 'dart:ui' as ui;

void main() {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  runApp(new HomePage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flight Search',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    );
  }
}