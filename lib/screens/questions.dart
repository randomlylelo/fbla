import 'package:flutter/material.dart';

// Q & A 

class Questions extends StatelessWidget {
  final String title;

  Questions(this.title);

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