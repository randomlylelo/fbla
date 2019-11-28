import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

// File imports
import 'package:fbla/screens/specific/addEvents.dart';
import 'package:fbla/screens/specific/allEvents.dart';
import 'package:fbla/widgets/help.dart';

// Calendar & Links to FBLA website
// Competitive Events & Current Events

// Contain Sign-Up to a current event,
// form for either competitive event,
// fundraiser, or community service.

Map<DateTime, List> _events = {
  DateTime(2019, 11, 4): ['Monthly Meeting'],
  DateTime(2019, 11, 9): ['State Fall Leadership Conference'],
  DateTime(2019, 11, 10): ['State Fall Leadership Conference'],
  DateTime(2019, 11, 11): ['State Fall Leadership Conference'],
  DateTime(2019, 11, 18): ['Prejudged Events Checkup'],
  DateTime(2019, 11, 18): ['Prejudged Events Checkup'],
  DateTime(2019, 11, 19): ['Prejudged Events Checkup'],
  DateTime(2019, 11, 20): ['Prejudged Events Checkup'],
  DateTime(2019, 11, 21): ['Prejudged Events Checkup'],
  DateTime(2019, 11, 22): ['Prejudged Events Checkup'],
  DateTime(2019, 12, 2): ['Monthly Meeting', 'Candy Box Fundrasing'],
  DateTime(2019, 12, 7): ['District Prejudge Events'],
  DateTime(2020, 1, 9): ['Monthly Meeting'],
  DateTime(2020, 2, 4): ['Monthly Meeting'],
  // DateTime(2020, 1, 9): ['District Competitions'], // TODO: GET DATE
  DateTime(2020, 3, 12): ['State Leadership Conference'],
  DateTime(2020, 3, 13): ['State Leadership Conference'],
  DateTime(2020, 3, 14): ['State Leadership Conference'],
  DateTime(2020, 3, 15): ['State Leadership Conference'],
  DateTime(2020, 6, 29): ['National Leadership Conference'],
  DateTime(2020, 6, 30): ['National Leadership Conference'],
  DateTime(2020, 7, 1): ['National Leadership Conference'],
  DateTime(2020, 7, 2): ['National Leadership Conference'],
};

Map<String, IconData> _iconsMap = {
  'Monthly Meeting': Icons.group,
  'Monthly': Icons.group,
  'monthly': Icons.group,
};

class Calendar extends StatefulWidget {
  final String title;

  Calendar(this.title);

  @override
  _CalendarState createState() => _CalendarState();
}

// * CALENDAR & MAIN *
class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;
  List _selectedEvents;

  Widget _iconCheck(String event) {
    if (_iconsMap.containsKey(event)) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(_iconsMap[event]),
      );
    }
    return Container();
  }

  Widget _itemCreator() {
    return Expanded(
      child: ListView(
        children: _selectedEvents
            .map(
              (event) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            _iconCheck(event),
                            Container(
                              child: Text(
                                event.toString(),
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              onPressed: () {
                                Navigator.of(context).pushNamed('form');
                              },
                              child: Text(
                                'Join Event',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

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
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Help('This page contains the calendar and events.','To use this page all you have to do is press any day, and if there is any events that day they will show it. There is a floating button to add events and view all events.'),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _tabCal(),
          _itemCreator(),
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
        todayColor: Color.fromRGBO(191, 13, 62, 1),
        selectedColor: Color.fromRGBO(0, 173, 230, 1),
        markersColor: Color.fromRGBO(0, 51, 160, 1),
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

// * FLOATING ACTION WIDGET *
class FloatingActionButt extends StatefulWidget {
  @override
  _FloatingActionButtState createState() => _FloatingActionButtState();
}

class _FloatingActionButtState extends State<FloatingActionButt>
    with TickerProviderStateMixin {
  AnimationController _controller;

  List<IconData> _icons = [
    Icons.add,
    Icons.list,
  ];

  List<String> _strItems = [
    'Add Event',
    'All Events',
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
              curve: Interval(0.0, 1.0 - index / _icons.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              icon: Icon(_icons[index]),
              label: Text(_strItems[index]),
              onPressed: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddEvent(
                        _events,
                        _iconsMap,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AllEvent(
                        _events,
                        _iconsMap,
                      ),
                    ),
                  );
                }
                _controller.reverse();
              },
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Color.fromRGBO(0, 173, 230, 1),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(_controller.value * 1.0 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(
                    _controller.isDismissed
                        ? Icons.arrow_upward
                        : Icons.arrow_upward,
                    color: Colors.white,
                  ),
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
