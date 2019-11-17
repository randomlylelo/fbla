import 'package:flutter/material.dart';

// Links to Social Media

class Social extends StatelessWidget {
  final String title;

  Social(this.title);

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