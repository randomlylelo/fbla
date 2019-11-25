import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

// Calendar & Links to FBLA website
// Competitive Events & Current Events

// Contain Sign-Up to a current event,
// form for either competitive event,
// fundraiser, or community service.
bool _addEvent = false;
bool _allEvent = false;

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
  bool _select = false;

  Map<DateTime, List> _events = {
    DateTime(2019, 11, 4): [
      'Monthly Meeting',
      'Monthly',
      'Monthly Meeting',
    ],
    DateTime(2020, 1, 4): ['Monthly Meeting'],
    DateTime(2019, 4, 4): ['Monthly Meeting'],
    DateTime(2019, 4, 22): ['Monthly Meeting'],
  };

  Map<String, IconData> _icons = {
    'Monthly Meeting': Icons.group,
  };

  Widget _iconCheck(String event) {
    if (_icons.containsKey(event)) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(_icons[event]),
      );
    }
    return Container();
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
      if (_select) {
        _select = !_select;
      }
      if (_selectedEvents.isNotEmpty) {
        _select = !_select;
      }
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
                  .map(
                    (event) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    onPressed: () {},
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButt(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Color _marker() {
    if (_select) {
      return Colors.transparent;
    }
    return Colors.black;
  }

  Widget _tabCal() {
    return TableCalendar(
      events: _events,
      calendarStyle: CalendarStyle(
        todayColor: Colors.red,
        selectedColor: Colors.orange,
        markersColor: _marker(),
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
                  setState(() {
                    _addEvent = !_addEvent;
                  });
                }
                else if (index == 1) {
                  setState(() {
                    _allEvent = !_allEvent;
                  });
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

// * TEXT FIELD FOR *
