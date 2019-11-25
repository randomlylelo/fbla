import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Calendar & Links to FBLA website
// Competitive Events & Current Events

// Contain Sign-Up to a current event,
// form for either competitive event,
// fundraiser, or community service.

class Calendar extends StatefulWidget {
  final String title;

  Calendar(this.title);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TableCalendar(
        calendarController: _calendarController,
      ),
    );
  }
}
