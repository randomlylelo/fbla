import 'package:flutter/material.dart';

import './widgets/nav.dart';

void main() => runApp(MyApp());

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
        body: Center(child: Text('My Page!')),
        drawer: Nav(),
      ),
    );
  }
}
