import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text(
                'Nex Chapter', 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: BoxDecoration(
                      color: Colors.black
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)
            ),
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Attendence'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Calendar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Events'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Form'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Officers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Questions'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Social'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}