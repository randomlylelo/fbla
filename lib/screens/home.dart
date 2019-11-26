import 'package:flutter/material.dart';
import '../widgets/nav.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(1), BlendMode.dstATop),
                  image: AssetImage('./lib/images/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Nav(),
    );
  }
}
