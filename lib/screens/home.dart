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
            child: Text(
              'ADMIN LOGIN',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            onPressed: () => Navigator.of(context).pushNamed('admin'),
          ),
        ],
      ),
      body: Center(child: Text('What each page does!')),
      drawer: Nav(),
    );
  }
}
