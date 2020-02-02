import 'package:flutter/material.dart';

import 'package:fbla/screens/all.dart';
import 'package:fbla/screens/specific/joinHome.dart';

// TODO: Add 'Hero' Class to all the appbars
// TODO: Add splash screen as loading screen
// TODO: Rewrite all the code & make code easier and more beautiful to read.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SchoolNav(),
      theme: ThemeData(
        fontFamily: 'RaleWay',
        primaryColor: Color.fromRGBO(0, 30, 96, 1), // Offical Color
        accentColor: Color.fromRGBO(0, 173, 230, 1), // Secondary Color
        // Color.fromRGBO(0, 0, 0, 1), // Black
        // Color.fromRGBO(0, 51, 160, 1), // PBL Blue
        // Color.fromRGBO(191, 13, 62, 1), // PBL Red
      ),
      routes: <String, WidgetBuilder>{
        // Part of Nav
        'attendence': (BuildContext context) => Attendence('Attendence'),
        'calendar': (BuildContext context) => Calendar('Calendar'),
        'contact': (BuildContext context) => Contact('Contact Us'),
        'form': (BuildContext context) => JoinForm('Form'),
        'officers': (BuildContext context) => Officers('Officers'),
        'questions': (BuildContext context) => Question('Q&A'),
        'social': (BuildContext context) => Social('Social Media'),
        'bug': (BuildContext context) => Bug('Report Bugs!'),

        // Part of Opening Screen
        'home': (BuildContext context) => Home(),
        'admin': (BuildContext context) => Admin(),

        // Part of home
        'joinHome': (BuildContext context) => JoinHome('Join FBLA!'),

        // Part of Main
        'selectNav': (BuildContext context) => _SelectNav(),
      },
    );
  }
}

class SchoolNav extends StatefulWidget {
  @override
  _SchoolNavState createState() => _SchoolNavState();
}

class _SchoolNavState extends State<SchoolNav> {
  String dropdownValue = 'Mater Lakes Academy High School';
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height * .9,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome! Please select your school.',
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Mater Lakes Academy High School',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'SUMBIT',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('selectNav');
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: height * .05,
              width: width,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Don\'t see your school?',
                    ),
                    Text(
                      'Ask your sponsor to email us at FBLAManage@gmail.com',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                    onPressed: () async {
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