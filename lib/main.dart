import 'package:flutter/material.dart';

import './widgets/nav.dart';
import './screens/all.dart';

void main() {
  runApp(MyApp(
    
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// _ - turns public class to private
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Home'),),
        body: Center(child: Text('What each page does!')),
        drawer: Nav(),
      ),
      routes: <String, WidgetBuilder>{
        'about': (BuildContext context) => About('About'),
        'attendence': (BuildContext context) => Attendence('Attendence'),
        'calendar': (BuildContext context) => Calendar('Calendar'),
        'contact': (BuildContext context) => Contact('Contact'),
        'events': (BuildContext context) => Events('Events'),
        'form': (BuildContext context) => JoinForm('Form'),
        'officers': (BuildContext context) => Officers('Officers'),
        'questions': (BuildContext context) => Question('Question'),
        'social': (BuildContext context) => Social('Social Media'),
      }
    );
  }
}
