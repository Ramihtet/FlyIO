import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flyio/Snack_Bar.dart';
import 'package:flyio/Password_reset/PassWord_reset.dart';
import 'dart:math';
import 'package:flyio/Password_reset/Sendmail_reset.dart';
import 'package:flyio/AgencyApp.dart';
import 'package:flyio/Guest_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'package:flyio/FlightSearchpage/Bar.dart';
import 'package:flyio/FlightSearchpage/Token.dart';
void main() => runApp(MyApp());
enum AuthMode { LOGIN, SINGUP }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
bool Agency_bool = false;
bool isAgency = false;
bool Guestbool = false;
bool rmmbr = false;
final Emailcon = TextEditingController();
final PasswordCon = TextEditingController();
final NameCon = TextEditingController();
var collection;
var Email_Change;
var path;
var Code;
var Messager_Token;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height

  double screenHeight;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // Set intial mode to login
  AuthMode _authMode = AuthMode.LOGIN;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
//                lowerHalf(context),
                upperHalf(context),
              ],
            ),

            _authMode == AuthMode.LOGIN
                ? loginCard(context)
                : singUpCard(context),
            pageTitle(),
          ],
        ),
      ),
    );
  }
  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          IconButton(icon: Image.asset('Newfolder/1.png'),
//            onPressed:(){}),
          Text(
            "FLYIO",
            style: TextStyle(
                fontFamily: 'Anton',
                fontSize: 40,
                color: Colors.white70,

                fontWeight: FontWeight.w800,
                letterSpacing: 10.0,
            ),
          )
        ],
      ),
    );
  }
  Widget loginCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 4),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'p',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: Emailcon,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Your Email", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller:PasswordCon ,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "Password", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StreamBuilder(
                          stream: Firestore.instance.collection("Users").snapshots(),
                          builder: (context,snapshot){
                          return MaterialButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => PassWordReset())
                              );
                              var rng = new Random();
                              setState(() {
                                Code = rng.nextInt(10000);
                                print(Code);

                            for (var i=0; i<snapshot.data.documents.length +1; i++) {
                            if (snapshot.data.documents[i]["Email"].toString().toLowerCase() == Emailcon.text.toLowerCase()){
                                Email_Change = snapshot.data.documents[i].documentID;
                                sendthemessage(Emailcon.text.toLowerCase());

                            }}
                              });

                              },
                            child: Text("Forgot Password ?"),
                          );
                        }
                      ),

                      Column(
                        children: <Widget>[
                          StreamBuilder(
                              stream: Firestore.instance.collection("Users").snapshots(),
                              builder: (context,snapshot){
                              return FlatButton(
                                child: Text("Login"),
                                color: Color(0xFF4B9DFE),
                                textColor: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 38, right: 38, top: 15, bottom: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  setState(() {
                                    Guestbool = false;
                                    collection = Firestore.instance.collection("Users").snapshots();
                                  });

                                  for (var i=0; i<snapshot.data.documents.length +1; i++) {

                                    if ((snapshot.data.documents[i]["Email"] == Emailcon.text && snapshot.data.documents[i]["Password"] == PasswordCon.text)){
                                      path = snapshot.data.documents[i].documentID;
                                      print(path);
                                      _firebaseMessaging.onTokenRefresh.listen(null);
                                        _firebaseMessaging.getToken().then((token) {
                                          Firestore.instance.collection("Users").document(path).updateData(
                                        {
                                          "Token":token,
                                        });
                                          Messager_Token =token;

                                        }


                                        );
                                        if (snapshot.data.documents[i]["Agency"]){
                                          isAgency = true;
                                          Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) => Agency())
                                        );}
                                        else{
                                          isAgency = false;
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) => Home())
                                          );

                                        }


                                    }
                                    else{

                                    }


                                  };
                                  },
                              );
                            }
                          ),
//                          Container(
//                            child: Row(
//                              children: <Widget>[
////                                Text("Remember Me"),
////                                Checkbox(value: rmmbr,
////                                    onChanged:(bool value){
////                                  print(rmmbr);
////                                  _save(Emailcon.text, PasswordCon.text);
////                                  setState(() {
////                                      rmmbr = value;
////                                    });
////                                }
////                                ),
//                              ],
//                            ),
//                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,17,0,0),
              child: Text(
                "Don't have an account ?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _authMode = AuthMode.SINGUP;
                    });
                  },
                  textColor: Colors.black87,
                  child: Text("Create Account"),
                ),
                FlatButton(
                  onPressed: () {
                    Guestbool = true;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                            builder: (context) => Guest())
                    );
                  },
                  textColor: Colors.black87,
                  child: Text("Continue As Guest"),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
  Widget singUpCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 5),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: NameCon,
                    decoration: InputDecoration(
                        labelText: "Your Name", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: Emailcon,

                    decoration: InputDecoration(
                        labelText: "Your Email", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: PasswordCon,
                    obscureText: true,

                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Agency"),
                      Switch(
                        value: Agency_bool,

                        onChanged: (value) {
                          setState(() {
                            Agency_bool = value;
                            print(Agency_bool);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          _firebaseMessaging.onTokenRefresh.listen(null);
                          _firebaseMessaging.getToken().then((token) {
                            Firestore.instance.collection("Flights").document(Emailcon.text).setData({});
                            Firestore.instance.collection("Flights").document(Emailcon.text).collection("Upcoming").document("Blank").setData({});
                            Firestore.instance.collection("Flights").document(Emailcon.text).collection("Cancelled").document("Blank").setData({});
                            Firestore.instance.collection("Messages").document(Emailcon.text).setData({});


                            Firestore.instance.collection("Users").document(Emailcon.text).setData(
                              {
                                "Email":Emailcon.text,
                                "Name":NameCon.text,
                                "Password":PasswordCon.text,
                                "Token":token,
                                "Agency":Agency_bool,
                              });
//                        ds.reference.delete();
//

                          });

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.LOGIN;

                });
              },
              textColor: Colors.black87,
              child: Text("Login"),
            )
          ],
        ),
//        Align(
//          alignment: Alignment.bottomCenter,
//          child: FlatButton(
//            child: Text(
//              "Terms & Conditions",
//              style: TextStyle(
//                color: Colors.grey,
//              ),
//            ),
//            onPressed: () {},
//          ),
//        ),
      ],
    );
  }
  Widget upperHalf(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, const Color(0x5685F4FF)],
            ),
          ),
          height: screenHeight,
        ),
        new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,

            ),


      ],
    );
  }
//  Widget lowerHalf(BuildContext context) {
//    return
////      Bar(height: screenHeight / 2,);
//  }
}