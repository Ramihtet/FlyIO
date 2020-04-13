import 'package:flutter/material.dart';
import 'package:flyio/List/Page.dart';
import 'package:flyio/InfoScreen/bar2.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';
import 'package:flyio/Payment/CreditCardPage.dart';


//void main() {
//  runApp(MaterialApp(
//    title: "Flights",
//    home:SecondScreen(),
//  ));
//}
class SecondScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
         Bar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 78.0),
              child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Container(
                    width: 440,
                    height:400 ,
//                      constraints: BoxConstraints.expand(
//                        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 400.0,
//                      ),
//                      padding: const EdgeInsets.all(10.0),

//                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
//                        color: Colors.blue[600],
                      ),
                      child: Container(
//                          constraints: BoxConstraints.expand(
//                            height: Theme.of(context).textTheme.display1.fontSize * 1.0 + 380.0,
//                          ),
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                          color: Colors.white30,
                          alignment: Alignment.topLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Flight Information For Flight:  ",
//                                  + flightnumberC  ,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Gloria",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70
                                  ),
                                ),
                                SizedBox(height: 10, ),
                              Container(

                                width: 390,
                                height: 330,
                                decoration:

                                BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      children: <Widget>[
//                                        SizedBox(height :10,),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Image.network(
                                                'https://daisycon.io/images/airline/?width=150&height=150&color=ffffff&iata='+iatacode,
                                        fit: BoxFit.cover
                                              ),
                                            ),
                                            SizedBox(width: 30,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: <Widget>[

                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(Icons.monetization_on,color: Colors.blue[200],),
                                                          SizedBox(width: 10,),
                                                          Text(
                                                            "Price : "+priceC,
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              color: Colors.blue[800],
                                                              fontSize: 16,
                                                              fontFamily: "Anton",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    SizedBox(height:15 ,),
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(Icons.hourglass_full,color: Colors.blue[200],),
                                                          SizedBox(width: 10,),
                                                          Text(
                                                            "Duration : "+durationC,
                                                            style: TextStyle(
                                                              color: Colors.blue[800],
                                                              fontSize: 16,
                                                              fontFamily: "Anton",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height:15 ,),
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(Icons.flight,color: Colors.blue[200],),
                                                          SizedBox(width: 10,),

                                                          Text(
                                                            "Number : "+flightnumberC,
                                                            style: TextStyle(
                                                              color: Colors.blue[800],
                                                              fontSize: 16,
                                                              fontFamily: "Anton",
                                                            ),
                                                          ),
                                                        ],
                                                      ),



                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10,),

                                              ],
                                            ),
                                          ],
                                        ),
                                      Container(
                                        height: 4,

                                        color: Colors.black,
                                      ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(55, 25, 0, 0),
                                          child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
//                                      SizedBox(width:10,),
                                            Text(
                                              wherefromfinal,
                                              style: TextStyle(
                                                color: Colors.blue[800],
                                                fontSize: 23,
                                                fontFamily: "Anton",
                                              )
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0 ,12, 0, 0),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                              child: Container(
                                                width: 150,
                                                height: 4,
                                                decoration:
                                                BoxDecoration(
                                                color: Colors.black,
//                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0 ,12, 0, 0),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                                wheretofinal,
                                                style: TextStyle(
                                                  color: Colors.blue[800],
                                                  fontSize: 20,
                                                  fontFamily: "Anton",
                                                )
                                            ),






                                          ]


                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                              )
//                                Icon(
//                                  Icons.monetization_on,
//                                  color: Colors.green,
//                                  size: 30.0,),
//                                SizedBox(height: 10, ),
//                                Text(
//                                  "   Price for ticket:   " + priceC  ,
//                                  style: TextStyle(
//                                      fontSize: 15,
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.black
//                                  ),
//                                ),
//                                SizedBox(height: 30, ),
//                                Icon(
//                                  Icons.local_airport,
//                                  color: Colors.red,
//                                  size: 30.0,),
//                                SizedBox(height: 10, ),
//                                Text(
//                                  "  Company:    ",
////                                      + companyC ,
//                                  style: TextStyle(
//                                    fontSize: 14.5,
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                                SizedBox(height: 30, ),
//                                Icon(
//                                  Icons.access_time,
//                                  color: Colors.yellowAccent,
//                                  size: 30.0,),
//                                SizedBox(height: 10, ),
//                                Text(
//                                  " Durarion:   ",
////                                      + durationC  ,
//                                  style: TextStyle(
//                                    fontSize: 15,
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),


                              
                              
                              
                              ])
                      )
//          Text(priceC),
//          Text(durationC),
//          Text(companyC),

                  ),
                  SizedBox(height: 20, ),
                  RaisedButton(
                    onPressed: (){print(priceC);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => CreditCard())
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent)
                    ),
                    child: Text(
                        'Confirm',
                        style: TextStyle(

                            fontSize: 20,
                          color: Colors.white70,
                          fontFamily: "Anton",
                        )
                    ),
                    color: Colors.blue[300],
                  ),



                ])
          )
            ),
          ),
        ],
      ),
    );
//    );
  }
}
