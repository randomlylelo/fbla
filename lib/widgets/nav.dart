import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  child: DrawerHeader(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 110,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child:
                              Image.asset('./lib/assets/images/manageLogo.png'),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'FBLA: Manage',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(0, 30, 96, 1)),
                  ),
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
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
