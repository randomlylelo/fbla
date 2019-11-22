import 'package:flutter/material.dart';

// track chapter meeting attendence

class Attendence extends StatefulWidget {
  final String title;

  Attendence(this.title);

  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  // Students
  List<String> _students = [
    'John Doe',
    'Jane Doe',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _students.length,
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              title: Text(_students[i]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        tooltip: 'Add Members/Meeting Dates',
        child: Icon(Icons.add),
      ),
    );
  }
}

