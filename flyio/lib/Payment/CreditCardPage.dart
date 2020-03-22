import 'package:flutter/material.dart';

import './screens/add_credit_card_screen.dart';
import 'package:flyio/Payment/bloc/add_credit_card_bloc.dart';
import 'package:flyio/Payment/bloc/bloc.dart';

void main() => runApp(CreditCard());

class CreditCard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddCreditCardBloc>(
      bloc: AddCreditCardBloc(),
      child: AddCreditCardScreen(),
    );
  }
}