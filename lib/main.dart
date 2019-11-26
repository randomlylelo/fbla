import 'package:flutter/material.dart';

import 'package:fbla/screens/all.dart';

// TODO: Add 'Hero' Class to all the appbars
// TODO: Add splash screen as loading screen
// TODO: Rewrite all the code & make code easier and more beautiful to read.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _SelectNav(),
      routes: <String, WidgetBuilder>{
        // Part of Nav
        'attendence': (BuildContext context) => Attendence('Attendence'),
        'calendar': (BuildContext context) => Calendar('Calendar'),
        'contact': (BuildContext context) => Contact('Contact'),
        'form': (BuildContext context) => JoinForm('Form'),
        'officers': (BuildContext context) => Officers('Officers'),
        'questions': (BuildContext context) => Question('Question'),
        'social': (BuildContext context) => Social('Social Media'),

        // Part of Opening Screen
        'home': (BuildContext context) => Home(),
        'admin': (BuildContext context) => Admin(),
      },
    );
  }
}

class _SelectNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(50.0),
                  ),
                  Text(
                      'Please choose, if you are unsure, then select student.'),
                  Divider(),
                  FlatButton(
                    child: Text('Student'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('home');
                    },
                  ),
                  FlatButton(
                    child: Text('Administrator'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('admin');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}