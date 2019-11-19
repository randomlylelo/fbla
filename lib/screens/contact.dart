import 'package:flutter/material.dart';

// Contact Us.\

// https://medium.com/flutterpub/a-simple-login-page-in-flutter-c2c65bb57072

class Contact extends StatefulWidget {
  final String title;

  Contact(this.title);
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // Declare Variables
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = '';
  String _firstName = '';
  String _lastName = '';

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text('lol'),
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

  _ContactState() {
    _emailFilter.addListener(_emailListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = '';
    } else {
      _email = _emailFilter.text;
    }
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
                Container(
                  child: Column(
                    children: <Widget>[
                      // Text Fields
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: _emailFilter,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true, // Change to false when done, used for viusal aid.
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _passwordFilter,
                          decoration: InputDecoration(labelText: 'First Name'),
                          obscureText: true,
                        ),
                      )
                    ],
                  ),
                ),
                // Buttons
                Container(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Login'),
                        onPressed: () => showAlert(),
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
