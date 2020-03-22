import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/Bar.dart';
import 'package:flyio/FlightSearchpage/Buttons.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new FlightSearch(),
    );
  }
}

class FlightSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
         Bar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  Expanded(child: ContentCard()) ,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
  return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children: <Widget>[
          new RoundedButton(text: "ONE WAY"),
          new RoundedButton(text: "ROUND"),
        ],
      ),
    );
  }
}