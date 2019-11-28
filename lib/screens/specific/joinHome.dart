import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  String _email = '';
  String _name = '';
  String _id = '';

  _JoinHomeState() {
    _emailFilter.addListener(_emailListen);
    _nameFilter.addListener(_nameListen);
    _idFilter.addListener(_idListen);
  }

  // Listeners
  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = '';
    } else {
      _email = _emailFilter.text;
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = '';
    } else {
      _name = _nameFilter.text;
    }
  }

  void _idListen() {
    if (_idFilter.text.isEmpty) {
      _id = '';
    } else {
      _id = _nameFilter.text;
    }
  }

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text('Successfully Signed Up to the Event.'),
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

  void displayMessage() {
    print('Email: $_email');
    print('Full Name: $_name');
    print('School ID: $_id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                      labelText: 'School ID',
                      prefixIcon: Icon(FontAwesomeIcons.addressCard),
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
                          showAlert();
                          _idFilter.clear();
                          _nameFilter.clear();
                          _emailFilter.clear();
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
