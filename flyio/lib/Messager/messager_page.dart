import 'package:flutter/material.dart';
import 'package:flyio/Profile//bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flyio/main.dart';

final Messege_of_messeger = TextEditingController();
var dropdownValue = "--Select An Agency--";
class Messager extends StatefulWidget {
  @override
  Bingo createState() => Bingo();
}
Map Agencies = {"LiveTravel Agency":"livetravel@hotmail.com","rami":"rami"};
class Bingo extends State<Messager> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
          new Bar(height: 210.0),
          ListView(children: <Widget>[
              SizedBox(

                height: 20,

              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 55,
                width: 200,
                child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.deepPurple
                    ),

                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                      }
                  ,
                    items: <String>["--Select An Agency--",'LiveTravel Agency','Travel@You','rami']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }
                    )
                        .toList(),
                  ),

              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 5, 18),
              decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  borderRadius: BorderRadius.circular(12)),
              height: 400,
              width: 2000,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.white,
                child:
                 StreamBuilder(
              stream: Firestore.instance.collection("Messages").document(Emailcon.text).collection(Agencies[dropdownValue]).snapshots(),

              builder: (context,snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                else {
                  return new ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        return ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                  child:
                                     Messager_Token == ds["Token"] ?
                                  Container(
                                    width: 200,
                                    height: 25,

                                    color: Colors.grey,
                                    child: Text(ds["Content"],
                                    ),
                                  )
                                  :

                                  Container(
                                    width: 200,
                                    height: 25,

                                    color: Colors.blue,
                                    child: Text(ds["Content"],
                                    ),
                                  )

                              )

                            ],
                          ),

                        );




                      }

                  );
                }
              }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(26,0,0,0),
                  child: Container(
                    height: 40,
                    width: 300,
                    color:Colors.white70,
                    child: TextFormField(
                      controller: Messege_of_messeger,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                FloatingActionButton(child: new Icon(Icons.send),onPressed: (){
                            Firestore.instance.collection("Messages").document(Emailcon.text)
                  .collection(Agencies[dropdownValue]).add(
                              {
                                "Content" : Messege_of_messeger.text,
                                "Token" : Messager_Token


                              }
                  );
                            Firestore.instance.collection("Messages").document(Agencies[dropdownValue])
                                .collection(Emailcon.text).add(
                                {
                                  "Content" : Messege_of_messeger.text,
                                  "Token" : Messager_Token


                                }
                            );
                            Firestore.instance.collection("Messages").document(Agencies[dropdownValue])
                                .collection("Contacts").document(Emailcon.text).setData(
                                {
                                  "Content" : Messege_of_messeger.text,

                                }
                            );
                            Firestore.instance.collection("Messages").document(Emailcon.text)
                                .collection("Contacts").document(Agencies[dropdownValue]).setData(
                                {
                                  "Content" : Messege_of_messeger.text,


                                }
                            );
                }
                )],
            ),

          ])
        ]));
  }
}