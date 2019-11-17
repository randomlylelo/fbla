import 'package:flutter/material.dart';

// Competitive Events & Current Events

// Contain Sign-Up to a current event,
// form for either competitive event, 
// fundraiser, or community service.

class Events extends StatelessWidget {
  final String title;

  Events(this.title);

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