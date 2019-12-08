import 'package:flutter/material.dart';
import 'package:fbla/widgets/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fbla/widgets/global.dart' as globals;

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

Widget _navBuilder(BuildContext context) {
  if (globals.admin) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: Text('Attendance'),
          leading: Icon(Icons.group),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('attendence');
          },
        ),
        ListTile(
          title: Text('Calendar'),
          leading: Icon(FontAwesomeIcons.calendarAlt),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('calendar');
          },
        ),
        ListTile(
          title: Text('Contact Us'),
          leading: Icon(Icons.mail),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('contact');
          },
        ),
        ListTile(
          title: Text('Officers'),
          leading: Icon(Icons.supervised_user_circle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('officers');
          },
        ),
        ListTile(
          title: Text('FAQ'),
          leading: Icon(Icons.question_answer),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('questions');
          },
        ),
        ListTile(
          title: Text('Social'),
          leading: Icon(FontAwesomeIcons.hashtag),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('social');
          },
        ),
        ListTile(
          title: Text('Sign-Up'),
          leading: Icon(FontAwesomeIcons.signInAlt),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('joinHome');
          },
        ),
      ],
    );
  }
  return ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      ListTile(
        title: Text('Calendar'),
        leading: Icon(FontAwesomeIcons.calendarAlt),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('calendar');
        },
      ),
      ListTile(
        title: Text('Contact Us'),
        leading: Icon(Icons.mail),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('contact');
        },
      ),
      ListTile(
        title: Text('Officers'),
        leading: Icon(Icons.supervised_user_circle),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('officers');
        },
      ),
      ListTile(
        title: Text('FAQ'),
        leading: Icon(Icons.question_answer),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('questions');
        },
      ),
      ListTile(
        title: Text('Social'),
        leading: Icon(FontAwesomeIcons.signInAlt),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('social');
        },
      ),
      ListTile(
        title: Text('Sign-Up'),
        leading: Icon(FontAwesomeIcons.hashtag),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('joinHome');
        },
      ),
    ],
  );
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 205,
            child: DrawerHeader(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 110,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Image.asset('./lib/assets/images/manageLogo.png'),
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
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Hello, $name!',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Color.fromRGBO(0, 30, 96, 1)),
            ),
          ),
          Expanded(
            child: _navBuilder(context),
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
