import 'dart:io';

import 'package:flyio/FlightSearchpage/multicity_input.dart';
import 'package:flutter/material.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
import 'package:flyio/FlightSearchpage/LoadingScreen.dart';
import 'package:flyio/List/classes.dart';
import 'package:flyio/List/FetchInfo.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flyio/List/Page.dart';
import 'package:async_loader/async_loader.dart';

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}
final wheretocon = new TextEditingController();
final wherefromcon = new TextEditingController();
final passcon = new TextEditingController();
DateTime _dateTime1;
DateTime _dateTime2;
var httpp;
var whereto ;
var wherefrom;
var pass;
var Airfrom;
var Airto;
Future<Info> futureInfo;

String datedep="hihi";
String datearr;

String printing(to,from,pass,datedep){
  print("https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode="+from+"&destinationLocationCode="+to+"&departureDate="+datedep+"&adults="+pass+"&max=10");
  return "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode="+from+"&destinationLocationCode="+to+"&departureDate="+datedep+"&adults="+pass+"&max=10";
}
Future<String> _loadCrosswordAsset() async {
  return await rootBundle.loadString('assets/airports.json');
}

Map decoded;
var wherefromfinal;
var wheretofinal;
String jsonCrossword;

Future<String> loadIata() async {
  jsonCrossword = await _loadCrosswordAsset();
//  print(jsonCrossword);
}

String showIata(String airport) {
//  print(jsonCrossword);
  decoded = jsonDecode(jsonCrossword);
  print(decoded[airport]);
  return decoded[airport];

}

//loadIata1 (String airport) async{
//  String fff  = await loadIata(airport);
////  print(fff);
//  return fff;
//}

final GlobalKey<AsyncLoaderState> asyncLoaderState =
new GlobalKey<AsyncLoaderState>();

//var _asyncLoader = new AsyncLoader(
//  key: asyncLoaderState,
//  initState: () async => await fetchInfo(httpp),
//  renderLoad: () => Center(child: new CircularProgressIndicator()),
//  renderError: ([error]) => FlightInput(),
//  renderSuccess: ({data}) => SplashScreenPage(),
//);


class _ContentCardState extends State<ContentCard> {

  void initState() {
    super.initState();
    loadIata();
//    print(tt);

//    print(jsonCrossword);

  }
  Future<Token> tt = fetchToken();






  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      color: Colors.blue[30],
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                SizedBox(height: 26,),

                _buildTabBar(),
                SizedBox(height: 5,),

                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        length: 1,
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
//    return Stack(
//      children: <Widget>[
//        new TabBar(
//          tabs: [
//            Tab(text: "Flights"),
//          ],
//          labelColor: Colors.black,
//          unselectedLabelColor: Colors.grey,
//        ),
//      ],
//    );
  return
  Text(
        "Search for Flights",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Indie",
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 120,
          ),
          child: new IntrinsicHeight(
            child: _buildMulticityTab(),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        FlightInput(),
        Expanded(child: Container()),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 320,),


          FutureBuilder<Token>(
              future: tt,
              builder: (context, snapshot) {
                      return FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            whereto = wheretocon.text;
                            wherefrom = wherefromcon.text;
                            loadIata();
                            wherefromfinal = showIata(wherefrom);
                            wheretofinal = showIata(whereto);
                            pass = passcon.text;
//                            print(datedep);
                            httpp = printing(wheretofinal, wherefromfinal, pass, datedep);
                            token = snapshot.data.accessToken;
//                            print(token);
                          });
                        futureInfo = fetchInfo(httpp);

                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Api4())
                          );
                        },
                        child: Icon(Icons.arrow_forward_ios, size: 31.0),


                      );
//                    });
              Future<Token> tt = fetchToken();
            })


        ]
        ),



      ],
    );
  }
}