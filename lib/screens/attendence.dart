import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  DateTime _today = DateTime.now();

  List<Map<String, dynamic>> studentDB;
  var loaded;

  @override
  void initState() {
    super.initState();
    () async {
      try {
        studentDB = await AttendenceDB().getStudents();
      } catch (e) {
        print(e);
      }
    }()
        .whenComplete(() {
      setState(() {
        loaded = true;
      });
    });
  }

  Future setUpDB() async {
    try {
      studentDB = await AttendenceDB().getStudents();
    } catch (e) {
      print(e);
    }
  }

  // Variables
  bool _addStudents = false;

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
                onSubmitted: (text) async {
                  if (!(text == '')) {
                    loaded = null;
                    setState(() {});
                    await AttendenceDB().addStudent(_inputFilter.text);
                    await setUpDB();
                    _inputFilter.clear();
                    loaded = true;
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
                        loaded = null;
                        setState(() {});
                        await AttendenceDB().addStudent(_inputFilter.text);
                        await setUpDB();
                        Future.delayed(Duration(milliseconds: 50)).then((_) {
                          _inputFilter.clear();
                        });
                        loaded = true;
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
                itemCount: studentDB.length,
                itemBuilder: (BuildContext context, int i) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: studentDB[i]['present'],
                        onChanged: (bool value) async {
                          loaded = null;
                          setState(() {});
                          await AttendenceDB()
                              .updateStudent(studentDB[i]['name'], value);
                          loaded = true;
                          setState(() {
                            studentDB[i]['present'] = value;
                          });
                        },
                      ),
                      Text(studentDB[i]['name']),
                      Spacer(),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.trash),
                        onPressed: () async {
                          loaded = null;
                          setState(() {});
                          await AttendenceDB()
                              .deleteStudent(studentDB[i]['name']);
                          await setUpDB();
                          loaded = true;
                          setState(() {});
                        },
                      ),
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
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        itemCount: studentDB.length,
        itemBuilder: (BuildContext context, int i) {
          return Row(
            children: <Widget>[
              Checkbox(
                value: studentDB[i]['present'],
                onChanged: (bool value) async {
                  loaded = null;
                  setState(() {});
                  await AttendenceDB()
                      .updateStudent(studentDB[i]['name'], value);
                  loaded = true;
                  setState(() {
                    studentDB[i]['present'] = value;
                  });
                },
              ),
              Text(studentDB[i]['name']),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loaded == null) {
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
            'This page is used to track attendence of the members, also you could add members to the attendence sheet.',
            'To use this page, you click on the side buttons of the people\'s name to mark that they are present and then use floating button to change the page to show a add members section, to add members all you have to do type their name and then press send on your keyboard or the button to the left.',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              '${_today.toLocal()}'.split(' ')[0] + ' - Meeting Attendence',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            alignment: Alignment.center,
          ),
          RaisedButton(
            onPressed: () async {
              final DateTime _date = await showDatePicker(
                  context: context,
                  initialDate: _today,
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2101));
              if (_date != null && _date != _today)
                setState(() {
                  _today = _date;
                });
            },
            child: Text('Pick date'),
            elevation: 1,
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
