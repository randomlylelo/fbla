import 'package:flutter/material.dart';

// About FBLA Screen

class About extends StatelessWidget {
  final String title;

  About(this.title);
  
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
