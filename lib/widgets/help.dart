import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  final String dummy;

  Help(this.dummy);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  
  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Text(widget.dummy),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OKAY')),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.help),
      onPressed: () {
        showAlert();
      },
    );
  }
}
