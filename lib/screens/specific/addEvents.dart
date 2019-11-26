// * Will only be used in Calendar.dart! *

import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  final Map<DateTime, List> events;
  final Map<String, IconData> icons;

  AddEvent(this.events, this.icons);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  Map<DateTime, List> _events;
  Map<String, IconData> _icons;
  final TextEditingController _eventFilter = TextEditingController();

  @override
  void initState() {
    _events = widget.events;
    _icons = widget.icons;
    super.initState();
  }

  @override
  void dispose() {
    _eventFilter.dispose();
    super.dispose();
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: TextField(
        controller: _eventFilter,
        onSubmitted: (text) {
          if (!(text == '')) {
            // _students.add(text);
            // _studentVal.add(false);
            _eventFilter.clear();
            setState(() {});
          }
        },
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          helperText: 'Type in Event then press the button',
          labelText: 'Event Name',
          suffixIcon: IconButton(
            onPressed: () {
              if (!(_eventFilter.text == '')) {
                // _students.add(_inputFilter.text);
                // _studentVal.add(false);
                Future.delayed(Duration(milliseconds: 50)).then((_) {
                  _eventFilter.clear();
                });
                setState(() {});
              }
            },
            icon: Icon(Icons.send),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Events'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              _textField(),
            ],
          ),
        ],
      ),
    );
  }
}
