import 'package:flutter/material.dart';

// Local Officers Screen

class Officers extends StatelessWidget {
  final String title;

  Officers(this.title);

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