import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

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
  List _selectedEvents;

  Map<DateTime, List> _events = {
    DateTime(2019, 11, 4): ['Monthly Meeting'],
    DateTime(2019, 12, 2): ['Monthly Meeting'],
    DateTime(2020, 1, 4): ['Monthly Meeting'],
    DateTime(2019, 4, 4): ['Monthly Meeting'],
    DateTime(2019, 4, 22): ['Monthly Meeting'],
  };

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _tabCal(),
          Expanded(
            child: ListView(
              children: _selectedEvents
                  .map((event) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: ListTile(
                          title: Text(event.toString()),
                          onTap: () => print('$event tapped!'),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButt(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _tabCal() {
    return TableCalendar(
      events: _events,
      calendarStyle: CalendarStyle(
        todayColor: Colors.red,
        selectedColor: Colors.orange,
        markersColor: Colors.black,
        canEventMarkersOverflow: false,
      ),
      calendarController: _calendarController,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        centerHeaderTitle: true,
      ),
      onDaySelected: _onDaySelected,
    );
  }
}

class FloatingActionButt extends StatefulWidget {
  @override
  _FloatingActionButtState createState() => _FloatingActionButtState();
}

class _FloatingActionButtState extends State<FloatingActionButt>
    with TickerProviderStateMixin {
  AnimationController _controller;

  List<IconData> icons = [
    Icons.add,
    Icons.person_add,
  ];

  List<String> strItems = [
    'Add Events',
    'Join Events',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Ticker
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(2, (int index) {
        Widget child = Container(
          height: 70.0,
          width: 150,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              icon: Icon(icons[index]),
              label: Text(strItems[index]),
              onPressed: () {},
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          FloatingActionButton(
            heroTag: null,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(_controller.value * 1.0 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(_controller.isDismissed
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_up),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
    );
  }
}
