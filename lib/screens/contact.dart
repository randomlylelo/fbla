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
  final TextEditingController _firstnameFilter = TextEditingController();
  final TextEditingController _lastnameFilter = TextEditingController();
  final TextEditingController _messageFilter = TextEditingController();
  String _email = '';
  String _firstName = '';
  String _lastName = '';
  String _message = "";

  _ContactState() {
    _emailFilter.addListener(_emailListen);
    _firstnameFilter.addListener(_firstnameListen);
    _lastnameFilter.addListener(_lastnameListen);
    _messageFilter.addListener(_messageListener);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = '';
    } else {
      _email = _emailFilter.text;
    }
  }
  void _firstnameListen() {
    if (_firstnameFilter.text.isEmpty) {
      _firstName = '';
    } else {
      _firstName = _firstnameFilter.text;
    }
  }
  void _lastnameListen() {
    if (_lastnameFilter.text.isEmpty) {
      _lastName = '';
    } else {
      _lastName = _lastnameFilter.text;
    }
  }
  void _messageListener() {
    if (_messageFilter.text.isEmpty) {
      _message = '';
    } else {
      _message = _messageFilter.text;
    }
  }

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text('Hello $_firstName, your message was sent to the developers, and they will contact you by your email: $_email'),
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
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text Fields
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: _emailFilter,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled:
                                true, // Change to false when done, used for viusal aid.
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 16.0),
                            width: MediaQuery.of(context).size.width * .40,
                            child: TextField(
                              controller: _firstnameFilter,
                              decoration:
                                  InputDecoration(labelText: 'First Name'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16.0),
                            width: MediaQuery.of(context).size.width * .40,
                            child: TextField(
                              controller: _lastnameFilter,
                              decoration:
                                  InputDecoration(labelText: 'Last Name'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          minLines: 2,
                          maxLines: null, // Infinity
                          controller: _messageFilter,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            filled:
                                true, // Change to false when done, used for viusal aid.
                          ),
                        ),
                      ),
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
