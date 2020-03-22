import 'package:flutter/material.dart';

class ProfileCardDraggable extends StatelessWidget {
  final int cardNum;
  ProfileCardDraggable(this.cardNum);

  Widget Images(index)
  {
    List<Widget> list = new List<Widget>();
    list.add(Image.asset('assets/UK.jpeg', fit: BoxFit.cover),);
    list.add(Image.asset('assets/cloud3.jpeg', fit: BoxFit.cover),);

    return list[index];
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Images(cardNum),
              Text('Card number $cardNum',
                  style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w700)),
              Padding(padding: EdgeInsets.only(bottom: 8.0)),
              Text('A short description.', textAlign: TextAlign.start),
            ],
          )),
    );
  }
}
