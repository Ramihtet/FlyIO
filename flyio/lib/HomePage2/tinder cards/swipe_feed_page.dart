import 'package:flutter/material.dart';
import 'cards_section_alignment.dart';
import 'cards_section_draggable.dart';

class SwipeFeedPage extends StatefulWidget {
  @override
  _SwipeFeedPageState createState() => _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {
  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.0,
//        centerTitle: true,
//        backgroundColor: Colors.white,
//        leading: IconButton(
//            onPressed: () {}, icon: Icon(Icons.settings, color: Colors.grey)),
//        title: Switch(
//          onChanged: (bool value) => setState(() => showAlignmentCards = value),
//          value: showAlignmentCards,
//          activeColor: Colors.red,
//        ),
//        actions: <Widget>[
//          IconButton(
//              onPressed: () {},
//              icon: Icon(Icons.question_answer, color: Colors.grey)),
//        ],
//      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
//          showAlignmentCards
//              ?
          Row(
            children: <Widget>[
              Container(
                  height: 30,
                  width: 40,
                  child:
                    Image.asset('assets/star.png', fit: BoxFit.cover)),
              SizedBox(width: 10,),
              Text(
                "Popular Destinations ",
                style: TextStyle(
                  fontFamily: 'Anton',
                  fontSize: 22,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          CardsSectionAlignment(context),
//              : CardsSectionDraggable(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget buttonsRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
////          FloatingActionButton(
////            mini: true,
////            onPressed: () {},
////            backgroundColor: Colors.white,
////            child: Icon(Icons.loop, color: Colors.yellow),
////          ),
////          Padding(padding: EdgeInsets.only(right: 8.0)),
////          FloatingActionButton(
////            onPressed: () {},
////            backgroundColor: Colors.white,
////            child: Icon(Icons.close, color: Colors.red),
////          ),
////          Padding(padding: EdgeInsets.only(right: 8.0)),
////          FloatingActionButton(
////            onPressed: () {},
////            backgroundColor: Colors.white,
////            child: Icon(Icons.favorite, color: Colors.green),
////          ),
////          Padding(padding: EdgeInsets.only(right: 8.0)),
////          FloatingActionButton(
////            mini: true,
////            onPressed: () {},
////            backgroundColor: Colors.white,
////            child: Icon(Icons.star, color: Colors.blue),
////          ),
//        ],
          ),
    );
  }
}
