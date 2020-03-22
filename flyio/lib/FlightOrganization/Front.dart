import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flyio/Payment/bloc/add_credit_card_bloc.dart';
import 'package:flyio/Payment/bloc/bloc.dart';
import 'package:flyio/FlightSearchpage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flyio/List/Page.dart';
import 'package:flyio/FlightOrganization/Front.dart';
import 'package:flyio/FlightSearchpage/InputCard.dart';
import 'package:flyio/Payment/CreditCardPage.dart';




void main() {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);

  runApp(StartPage());
}

List<String> upcomingTrips = ["New Trip 1","New Trip 2"];
List<String> oldTrips = ["old Trip 1","old Trip 2","old Trip 3"];
List<String> cancelledTrips = ["Cancelled Trip 1","Cancelled Trip 2","Cancelled Trip 3","Cancelled Trip 4"];

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "New Task",
      debugShowCheckedModeBanner: false,
      home: new HomePage1(),
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  Widget AlertButton(ds,context1){
    Alert(
      context: context1,
      title: "Flight",
      desc: "FLight Number...",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel Flight",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Firestore.instance.collection("Flights").document("seN9HtrtkDv2R2GrK1F1")
                           .collection("Cancelled").add(
                           {"Price":ds["Price"],
                             "Duration":ds["Duration"],
                             "Company":ds["Company"],
                             "Flight_Number":ds["Flight_Number"],
                             "From":ds["From"],
                             "To":ds["To"],
                             "Departure_Date":ds["Departure_Date"],

                           });
            ds.reference.delete();
            Navigator.pop(context1);


          },
          width: 120,
        )
      ],
    ).show();


  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => HomePage())
            );},
        ),
        title: new Text(
          "Trips",
          textAlign: TextAlign.center,
        ),

        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(
                icon: new Icon(Icons.airplanemode_active),
                text: "UPCOMING"),
            new Tab(
              icon: new Icon(Icons.airplanemode_inactive),
              text: "CANCELLED",
            ),
            new Tab(
              icon: new Icon(Icons.check_circle_outline),
              text: "PAST",
            )
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          StreamBuilder(
            stream: Firestore.instance.collection("Flights").document('seN9HtrtkDv2R2GrK1F1').collection("Upcoming").snapshots(),

              builder: (context,snapshot){
              return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                  itemBuilder: (context,index){
                   DocumentSnapshot ds  = snapshot.data.documents[index];
                   return ListTile(
                     title: Row(
                       children: <Widget>[
                         Expanded(
                             child: Text(
                               ds["Flight_Number"],

                             ))

                       ],
                     ),
                     onTap: (){
//                       Firestore.instance.collection("Flights").document("seN9HtrtkDv2R2GrK1F1")
//                           .collection("Upcoming").add(
//                           {"Price":priceC,
//                             "Duration":durationC,
//                             "Company":companyC,
//                             "Flight_Number":flightnumberC,
//                             "From":wherefrom,
//                             "To":whereto,
//                             "Departure_Date":datedep,
//
//
//
//                           },
//                       ds.reference.updateData({'Name':"Ali"});
                       AlertButton(ds,context);


                     },
                   );


//                   return Column(
//                     children: <Widget>[
//                       FloatingActionButton(onPressed: (){
//                         Firestore.instance.collection("Users").document()
//                             .setData({"Name":"Ali"});
//
//
//                       }),
//                       new Text(ds['Name']),
//                     ],
//                   );

                  }

              );
              }


          ),
//          new ListView.builder(
//            itemBuilder: (context,index){
//              return Card(
//                  child: Padding(
//                      padding: const EdgeInsets.only(top:18.0,bottom: 18,left: 10,right: 10),
//                      child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            FloatingActionButton(onPressed: (){
//
//
//                            },),
//                            Text(upcomingTrips[index])
//                          ]
//                      )
//                  )
//              );
//            },
//            itemCount: upcomingTrips.length,
//          ),


          StreamBuilder(
              stream: Firestore.instance.collection("Flights").document('seN9HtrtkDv2R2GrK1F1').collection("Cancelled").snapshots(),

              builder: (context,snapshot){
                return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot ds  = snapshot.data.documents[index];
                      return ListTile(
                        title: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  ds["Flight_Number"],

                                ))

                          ],
                        ),
//                     onTap: (){
//                       ds.reference.updateData({
//                       'Name':"Ali"
//
//                     });
//                     },
                      );


//                   return Column(
//                     children: <Widget>[
//                       FloatingActionButton(onPressed: (){
//                         Firestore.instance.collection("Users").document()
//                             .setData({"Name":"Ali"});
//
//
//                       }),
//                       new Text(ds['Name']),
//                     ],
//                   );

                    }

                );
              }


          ),
          new ListView.builder(
            itemBuilder: (context,index){
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.only(top:18.0,bottom: 18,left: 10,right: 10),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(oldTrips[index])
                          ]
                      )
                  )
              );
            }, itemCount: oldTrips.length,
          ),
        ],
        controller: _tabController,),
    );
  }
}

