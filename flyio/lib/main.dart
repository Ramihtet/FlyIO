import 'package:flutter/material.dart';
import 'package:flyio/Profile/profile.dart';
import 'package:flyio/FlightOrganization/Front.dart';
import 'package:flyio/FlightSearchpage/HomePage.dart';
import 'package:flyio/HomePage2/HomePage/page.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:firebase_messaging/firebase_messaging.dart';


//void main(){
//
//  RenderErrorBox.backgroundColor = Colors.transparent;
//  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
//  runApp(App());
//}
//
//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Home(),
//    );
//  }
//}

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
    return _HomeState();

  }

}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [Page(), HomePage(), HomePage1(), Account()];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState(){
    super.initState();
    _firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
    _firebaseMessaging.getToken().then((token) {
//      print(token);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              'Flight Search',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              'Flight History',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              )),

        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

void sendTokenToServer(String fcmToken){
  print(fcmToken);
//  print("e");
}