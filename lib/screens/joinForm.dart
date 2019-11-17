import 'package:flutter/material.dart';

// Join FBLA Form Screen

class JoinForm extends StatelessWidget {
  final String title;

  JoinForm(this.title);

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