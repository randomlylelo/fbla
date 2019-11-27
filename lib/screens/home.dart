import 'package:flutter/material.dart';
import 'package:fbla/widgets/nav.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'ADMIN LOGIN',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            onPressed: () => Navigator.of(context).pushNamed('admin'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('./lib/assets/images/fbla.png'),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text('Offical Future Business Leaders of America-Phi Beta Lambda logo.'),
                )
              ],
            ),
          ],
        ),
      ),
      drawer: Nav(),
    );
  }
}
