import 'package:flutter/material.dart';
import '../widgets/nav.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text('Admin'),
            onPressed: () => print('lol'),
          ),
        ],
      ),
      body: Center(child: Text('What each page does!')),
      drawer: Nav(),
    );
  }
}