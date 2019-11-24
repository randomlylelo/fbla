import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // Students
  List<String> _students = [
    'John Doe',
    'Jane Doe',
  ];

  List<bool> _studentVal = [
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          Expanded(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Members/Meeting Dates',
        child: Icon(Icons.add),
      ),
    );
  }
}
