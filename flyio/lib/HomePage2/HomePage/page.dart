import 'package:flutter/material.dart';
import 'package:flyio/HomePage2/HomePage/bar22.dart';
import 'package:flyio/HomePage2/tinder cards/swipe_feed_page.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Page()
//    );
//  }
//}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
              ),
            ),
            height: 700,
          ),
          new Column(
            children: <Widget>[
              new AppBar(
//              leading: new IconButton(
//                icon: new Icon(Icons.arrow_back, color: Colors.blueAccent),
//                onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(
//                          builder: (context) => Api4())
//                  );},
//              ),
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
//            SizedBox(height: 0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 40,),
                  Container(
                    child: Image(image: AssetImage('assets/cloud3.jpeg'),fit: BoxFit.fill,),
                    height: 150,
                    width: 150,
                    color: Colors.black,
                  ),
                  SizedBox(width: 40,),
                  Container(
                    child: Image(image: AssetImage('assets/cloud4.jpeg'),fit: BoxFit.fill,),
                    height: 150,
                    width: 160,
                    color: Colors.black,
                  ),
                ],
              )

            ],
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0, 230, 0, 0),
            child: Container(
              height: 470,
              width: 430,
              color: Colors.blue,
              child: SwipeFeedPage()
            ),
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(177, 200, 0, 0),
            child: FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.blue[700],
              child: Icon(Icons.airplanemode_active),
            ),
          ),

        ]
        )
    );
  }
}