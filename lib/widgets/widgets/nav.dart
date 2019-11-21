import 'package:flutter/material.dart';

class Nav extends StatefulWidget {  
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text(
                'NeX Chapter', 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: BoxDecoration(
                      color: Colors.blue
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)
            ),
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('about');
            },
          ),
          ListTile(
            title: Text('Attendence'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('attendence');
            },
          ),
          ListTile(
            title: Text('Calendar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('calendar');
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('contact');
            },
          ),
          ListTile(
            title: Text('Events'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('events');
            },
          ),
          ListTile(
            title: Text('Form'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('form');
            },
          ),
          ListTile(
            title: Text('Officers'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('officers');
            },
          ),
          ListTile(
            title: Text('Questions'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('questions');
            },
          ),
          ListTile(
            title: Text('Social'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('social');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            }
          )
        ],
      ),
    );
  }
}