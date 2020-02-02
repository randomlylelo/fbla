import 'package:fbla/db/eventsDB.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

// File imports
import 'package:fbla/screens/specific/addEvents.dart';
import 'package:fbla/screens/specific/allEvents.dart';
import 'package:fbla/widgets/help.dart';
import 'package:fbla/widgets/global.dart' as globals;

// Calendar & Links to FBLA website
// Competitive Events & Current Events

// Contain Sign-Up to a current event,
// form for either competitive event,
// fundraiser, or community service.

Map<DateTime, List> _events = {};

Map<String, IconData> _iconsMap = {
  'Monthly Meeting': Icons.group,
  'Monthly': Icons.group,
  'monthly': Icons.group,
};

DateTime tdy = DateTime.now();
List test = [];

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
                            delEvent(context, event),
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

  var loaded;

  @override
  void initState() {
    super.initState();
    () async {
      try {
        _events = await EventDB().getEvents();
      } catch (e) {
        print(e);
      }
    }()
        .whenComplete(() {
      setState(() {
        loaded = true;
      });
    });
    final _selectedDay = DateTime.now();
    final _select2 = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day, 0,0,0,0,0);
    _selectedEvents = _events[_select2] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      tdy = day;
      _selectedEvents = events;
      test = _selectedEvents;
    });
  }

  Widget delEvent(BuildContext context, dynamic event) {
    if (globals.admin) {
      return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        onPressed: () async {
          loaded = null;
          setState(() {});
          _selectedEvents = await EventDB().delEvent(tdy, event);
          _events = await EventDB().getEvents();
          loaded = true;
          setState(() {});
        },
        child: Text(
          'Delete Event',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
    return Container();
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
            'This page contains the calendar and events.',
            'To use this page all you have to do is press any day, and if there is any events that day they will show it. There is a floating button to add events and view all events.',
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _tabCal(),
          _itemCreator(),
        ],
      ),
      floatingActionButton: FloatingActionButt(this),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _tabCal() {
    return TableCalendar(
      availableGestures: AvailableGestures.horizontalSwipe,
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
  final _CalendarState parent;

  FloatingActionButt(this.parent);

  @override
  _FloatingActionButtState createState() => _FloatingActionButtState();
}

class _FloatingActionButtState extends State<FloatingActionButt>
    with TickerProviderStateMixin {
  AnimationController _controller;

  List<IconData> _icons = [
    Icons.list,
    Icons.add,
  ];

  List<String> _strItems = [
    'All Events',
    'Add Event',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Ticker
      duration: const Duration(milliseconds: 100),
    );
    if (!globals.admin) {
      _strItems = [
        'All Events',
      ];
      _icons = [
        Icons.list,
      ];
    }
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
      children: List.generate(_strItems.length, (int index) {
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
              onPressed: () async {
                if (index == 1) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddEvent(
                        _events,
                        _iconsMap,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                  setState(() async {
                    widget.parent.loaded = null;
                    widget.parent.setState(() {});
                    _events = await EventDB().getEvents();
                    widget.parent._selectedEvents = await EventDB().getFlatEvent(tdy, test);
                    widget.parent.loaded = true;
                    widget.parent.setState(() {});
                  });
                } else if (index == 0) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AllEvent(
                        _events,
                        _iconsMap,
                      ),
                    ),
                  );
                  setState(() async {
                    widget.parent.loaded = null;
                    widget.parent.setState(() {});
                    _events = await EventDB().getEvents();
                    widget.parent._selectedEvents = await EventDB().getFlatEvent(tdy, test);
                    widget.parent.loaded = true;
                    widget.parent.setState(() {});
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
