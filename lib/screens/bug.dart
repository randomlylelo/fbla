import 'package:flutter/material.dart';

import 'package:fbla/db/bugDB.dart';
import 'package:fbla/widgets/help.dart';
// Contact Us.

class Bug extends StatefulWidget {
  final String title;

  Bug(this.title);
  @override
  _BugState createState() => _BugState();
}

class _BugState extends State<Bug> {
  // Declare Variables
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _nameFilter = TextEditingController();
  final TextEditingController _messageFilter = TextEditingController();
  String _email = '';
  String _name = '';
  String _message = "";
  bool loading = false;

  _BugState() {
    _emailFilter.addListener(_emailListen);
    _nameFilter.addListener(_nameListen);
    _messageFilter.addListener(_messageListener);
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

  void _messageListener() {
    if (_messageFilter.text.isEmpty) {
      _message = '';
    } else {
      _message = _messageFilter.text;
    }
  }

  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text(
          'Hello $_name, your message was sent to the developers, and they will contact you by your email: $_email'),
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
    print('Name: $_name');
    print('Message: $_message');
  }

  @override
  Widget build(BuildContext context) {
    if(loading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Help(
            'This page is used to Bug the developers of the app but also to message the officers/advisors of their school\'s respective chapters.',
            'In order to use this, all you have to do is to press the textboxes and fill in the necessary information, then you click \'SUMBIT\'.',
          ),
        ],
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: _emailFilter,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
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
                          minLines: 3,
                          maxLines: null, // Infinity
                          controller: _messageFilter,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            prefixIcon: Icon(Icons.message),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
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
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          String messageId =
                              await BugDB().getMessageId(_emailFilter.text);
                          await BugDB().sendMessage(
                              messageId,
                              _emailFilter.text,
                              _nameFilter.text,
                              _messageFilter.text);
                          setState(() {
                            loading = false;
                          });
                          showAlert();
                          _nameFilter.clear();
                          _emailFilter.clear();
                          _messageFilter.clear();
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
