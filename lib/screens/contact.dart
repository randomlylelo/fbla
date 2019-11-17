import 'package:flutter/material.dart';

// Contact Us.

class Contact extends StatelessWidget {
  final String title;

  Contact(this.title);

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