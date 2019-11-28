import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  final String description;
  final String help;

  Help(this.description, this.help);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  void showAlert() {
    AlertDialog dialog = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.description),
          Divider(),
          Text(widget.help),
          Container(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              elevation: 3,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OKAY',
                style: TextStyle(
                  color: Color.fromRGBO(0, 30, 96, 1),
                ),
              ),
            ),
          ),
        ],
      ),
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
