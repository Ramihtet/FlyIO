import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/Bar.dart';
import 'package:flyio/FlightSearchpage/Buttons.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';

class HomePage extends StatefulWidget {
  FlightSearch createState()=> FlightSearch();
//  @override
//  Widget build(BuildContext context) {
//
//    return new MaterialApp(
//      home: new FlightSearch(),
//    );
//  }
}

class FlightSearch extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
         Bar(),
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
  return Container(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
          children: <Widget>[
            SizedBox(width: 20,),
            GestureDetector(onTap: (){OneWay();},child: new RoundedButton(text: "ONE WAY"),),
            GestureDetector(onTap: (){Round();},child : new RoundedButton(text: "ROUND",)),

          ],
      ),
        ),
    );
  }
void Round(){
  setState(() {
    trip = true;


  });
}
void OneWay(){
    setState(() {
      trip = false;


    });
}
}