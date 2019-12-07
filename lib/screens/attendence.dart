import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fbla/widgets/help.dart';
import 'package:fbla/db/attendenceDB.dart';

// track chapter meeting attendence

class Attendence extends StatefulWidget {
  final String title;

  Attendence(this.title);

  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  // Date & Time
  String _monDayYear = DateFormat('EEE d, MMM yyyy').format(DateTime.now());

  List<Map<String, dynamic>> studentDB;

  // Variables
  bool _addStudents = false;

  // Students
  List<String> _students = [
    'John Doe',
    'Jane Doe',
  ];
  List<bool> _studentVal = [
    false,
    false,
  ];
  // TextController
  final TextEditingController _inputFilter = TextEditingController();

  Widget _addStuds() {
    if (_addStudents) {
      return Expanded(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                controller: _inputFilter,
                onSubmitted: (text) {
                  if (!(text == '')) {
                    _students.add(text);
                    _studentVal.add(false);
                    _inputFilter.clear();
                    setState(() {});
                  }
                },
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  helperText: 'Type in Student name then press the button',
                  labelText: 'Student Name',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (!(_inputFilter.text == '')) {
                        _students.add(_inputFilter.text);
                        _studentVal.add(false);
                        AttendenceDB().addStudent(_inputFilter.text);
                        studentDB = await AttendenceDB().getStudents();
                        print(studentDB[1]['name']);
                        Future.delayed(Duration(milliseconds: 50)).then((_) {
                          _inputFilter.clear();
                        });
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              // You need this for listView to Work.
              // https://github.com/flutter/flutter/issues/18341
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                itemCount: _students.length,
                itemBuilder: (BuildContext context, int i) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: _studentVal[i],
                        onChanged: (bool value) {
                          setState(() {
                            _studentVal[i] = value;
                          });
                        },
                      ),
                      Text(_students[i]),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return Expanded(
      // You need this for listView to Work.
      // https://github.com/flutter/flutter/issues/18341
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        itemCount: _students.length,
        itemBuilder: (BuildContext context, int i) {
          return Row(
            children: <Widget>[
              Checkbox(
                value: _studentVal[i],
                onChanged: (bool value) {
                  setState(() {
                    _studentVal[i] = value;
                  });
                },
              ),
              Text(_students[i]),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Help(
            'This page is used to track attendence of the members, also you could add members to the attendence sheet.',
            'To use this page, you click on the side buttons of the people\'s name to mark that they are present and then use floating button to change the page to show a add members section, to add members all you have to do type their name and then press send on your keyboard or the button to the left.',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              '$_monDayYear - Meeting Attendence',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            alignment: Alignment.center,
          ),
          _addStuds(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _addStudents = !_addStudents;
          });
        },
        tooltip: 'Add Members/Meeting Dates',
        child: Icon(
          _addStudents ? Icons.close : Icons.add,
          color: Colors.white,
        ), // if addstudents is true then show close button, else show add.
      ),
    );
  }

  @override
  void dispose() {
    // Cleaning up Controller.
    _inputFilter.dispose();
    super.dispose();
  }
}
