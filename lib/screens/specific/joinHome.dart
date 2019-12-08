import 'package:fbla/db/membersDB.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fbla/widgets/help.dart';
// Join FBLA Form Screen ONLY FOR HOME

class JoinHome extends StatefulWidget {
  final String title;

  JoinHome(this.title);

  @override
  _JoinHomeState createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> {
  // Declare Variables
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _nameFilter = TextEditingController();
  final TextEditingController _idFilter = TextEditingController();
  final TextEditingController _tshirtFilter = TextEditingController();
  final TextEditingController _topicFilter = TextEditingController();

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text('Successfully Signed Up to FBLA.'),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Okay')),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Help(
            'This is a form that new members will fill out to join the FBLA Chapter of that school.',
            'To use this page, all you have to do is to fill out the text fields and then press \'SUMBIT\'',
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Text Fields
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _emailFilter,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      //prefix: Text('', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _nameFilter,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _idFilter,
                    decoration: InputDecoration(
                      labelText: 'Grade',
                      prefixIcon: Icon(FontAwesomeIcons.graduationCap),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _tshirtFilter,
                    decoration: InputDecoration(
                      labelText: 'T-Shirt Size',
                      prefixIcon: Icon(FontAwesomeIcons.tshirt),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _topicFilter,
                    decoration: InputDecoration(
                      labelText: 'Topic',
                      prefixIcon: Icon(Icons.subject),
                    ),
                  ),
                ),

                // Buttons
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.blue,
                        child: Text(
                          'SUMBIT',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          MembersDB().signUp(_emailFilter.text, _nameFilter.text, _idFilter.text, _tshirtFilter.text, _topicFilter.text);
                          showAlert();
                          _idFilter.clear();
                          _nameFilter.clear();
                          _emailFilter.clear();
                          _topicFilter.clear();
                          _tshirtFilter.clear();
                        },
                      ),
                    ],
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
