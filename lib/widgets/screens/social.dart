import 'package:flutter/material.dart';

import '../widgets/help.dart';
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
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Help('T'),
                  color: Colors.green[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Help('T'),
                  color: Colors.green[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Help('T'),
                  color: Colors.green[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Who scream'),
                  color: Colors.green[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution is coming...'),
                  color: Colors.green[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.green[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Revolution, they...'),
                  color: Colors.green[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
