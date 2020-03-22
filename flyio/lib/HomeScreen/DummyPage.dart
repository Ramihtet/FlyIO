import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flyio/HomeScreen/FetchImage.dart';
import 'package:flyio/HomeScreen/FetchMostBooked.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/HomeScreen/classes.dart';

void main() {

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
String country_of_origin = "MOW";

class _MyAppState extends State<MyApp> {

  Future<Token> tt = fetchToken();
  Future<Img> m1 = fetchImg("https://api.teleport.org/api/urban_areas/slug:san-francisco-bay-area/images/");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile Setup'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: FutureBuilder<Token>(
                    future: tt,
                    builder: (context, snapshot) {
                      return FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            token = snapshot.data.accessToken;
                            fetchDestinations(country_of_origin);
                          });

                        },
                        child: Icon(Icons.airplanemode_active, size: 31.0),

                      );
//                    });
                    })
              ),
              SizedBox(height:50, ),
              Wrap(
                children: <Widget>[

                  FutureBuilder<Img>(
                    future: m1,
                    builder: (context,snapshot) {
                      return Container(
                        width: 150,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          onPressed: null,
                          child: Image.network(snapshot.data.photos[0].image.mobile),


                        ),
                      );
                    }),
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: null,
                      child: Image.network('https://i.insider.com/5a9dbd83e6a9cf1b008b46ad?width=800&format=jpeg&auto=webp'),


                    ),
                  ),

                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: null,
                      child: Image.network('https://www.flaticon.com/premium-icon/icons/svg/2209/2209509.svg'),


                    ),
                  ),

                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: null,
                      child: Image.network('https://www.flaticon.com/premium-icon/icons/svg/2209/2209509.svg'),


                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
