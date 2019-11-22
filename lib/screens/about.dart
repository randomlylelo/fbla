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
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'What is FBLA?',
                      style: DefaultTextStyle.of(context).style.apply(
                            color: Colors.black,
                            fontSizeFactor: 1.0,
                            decoration: TextDecoration.none,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
