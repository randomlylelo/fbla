// * Will only be used in Calendar.dart! *

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fbla/db/eventsDB.dart';
import 'package:fbla/widgets/help.dart';

class AddEvent extends StatefulWidget {
  final Map<DateTime, List> events2;
  final Map<String, IconData> icons;

  AddEvent(this.events2, this.icons);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  // Declare Variables
  Map<DateTime, List> _events;
  final TextEditingController _eventFilter = TextEditingController();

  // Date & Time Selector.
  DateTime _date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    () async {
      _events = await EventDB().getEvents();
    }();
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
        onSubmitted: (text) async {
          _events = await EventDB().getEvents();
          if (!(text == '')) {
            if (_events[_date].isNotEmpty) {
              var list = _events[_date].toList();
              list.add(_eventFilter.text); // Add the Text
              EventDB().addEvent(_date, list);
            } else {
              var list = _events[_date].toList();
              list.add(_eventFilter.text); // Add the Text
              EventDB().addEvent(_date, list);
            }
            _eventFilter.clear();
            Future.delayed(Duration(milliseconds: 200)).then((_) {
              Navigator.of(context).pop();
            });
            setState(() {});
          }
        },
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          helperText: 'Type in Event Name then press send',
          labelText: 'Event Name',
          suffixIcon: IconButton(
            onPressed: () async {
              _events = await EventDB().getEvents();
              if (!(_eventFilter.text == '')) {
                EventDB().getEvents();
                if (_events[_date] == null) {
                  // If Null
                  _events[_date] = []; // Create Empty List
                }
                if (_events[_date].isNotEmpty) {
                  // If List has things inside
                  var list = _events[_date].toList();
                  list.add(_eventFilter.text); // Add the Text
                  EventDB().addEvent(_date, list);
                } else {
                  var list = _events[_date].toList();
                  list.add(_eventFilter.text); // Add the Text
                  EventDB().addEvent(_date, list);
                }
                Future.delayed(Duration(milliseconds: 50)).then((_) {
                  FocusScope.of(context).unfocus();
                  _eventFilter.clear();
                });
                Future.delayed(Duration(milliseconds: 200)).then((_) {
                  Navigator.of(context).pop();
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

  Widget _datePicker() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.calendar_today),
              ),
              InkWell(
                onTap: (() => _selectDate(context)),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(DateFormat('EEEE, MMMM d').format(_date))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Events'),
        actions: <Widget>[
          Help(
            'This page is used to add events to the calendar.',
            'To use this page, all you have to do is press on the date and then choose your date and then type in the event name, then press send on your keyboard or the button to the left.',
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              _datePicker(),
              _textField(),
            ],
          ),
        ],
      ),
    );
  }
}
