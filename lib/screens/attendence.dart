import 'package:flutter/material.dart';

// track chapter meeting attendence

class Attendence extends StatelessWidget {
  final String title;

  Attendence(this.title);
  
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