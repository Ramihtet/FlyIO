import 'package:flutter/material.dart';
import 'package:flyio/Messager/messager_page.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flyio/main.dart';
import 'package:flyio/messagerAppAgency.dart';

var dropdownValue = "--Select An Agency--";
var talkingto;
class Agency extends StatefulWidget {
  @override
  Bingo1 createState() => Bingo1();
}

Map Agencies = {"LiveTravel Agency": "livetravel@hotmail.com", "rami": "rami"};

class Bingo1 extends State<Agency> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Travel Agency"),
      ),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection("Messages").document(Emailcon.text).collection("Contacts").snapshots(),

                  builder: (context,snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    else {
                      return new ListView.builder(

                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data.documents[index];
                            return ListTile(
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          talkingto = ds.documentID;

                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MessagerAgency()));
                                      },
                                      child: Card(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            ds.documentID,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: 'Lalezar',
                                        ),),
                                      )),
                                    ),


                                  )

                                ],
                              ),

                            );




                          }

                      );
                    }
                  }),
            ),

          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){print(Emailcon.text);},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
