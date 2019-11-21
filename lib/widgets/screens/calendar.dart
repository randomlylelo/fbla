import 'package:flutter/material.dart';

// Calendar & Links to FBLA website

class Calendar extends StatelessWidget {
  final String title;

  Calendar(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Placeholder'),
      ),
    );
  }
}