import 'package:fbla/db/eventsDB.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fbla/widgets/help.dart';
import 'package:fbla/widgets/global.dart' as globals;

// Widget used to display all the events
class AllEvent extends StatefulWidget {
  final Map<DateTime, List> _eventss;
  final Map<String, IconData> _iconsMap;

  AllEvent(this._eventss, this._iconsMap);

  @override
  _AllEventState createState() => _AllEventState();
}

class _AllEventState extends State<AllEvent> {
  Map<DateTime, List> _events;
  @override
  void initState() {
    super.initState();
    _events = widget._eventss; 
  }

  var loaded = true;
  @override
  Widget build(BuildContext context) {
    
    if (loaded == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('All Events'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
        actions: <Widget>[
          Help(
              'This page contains all the events that is happening. Current events, competition events, and signups to the event.',
              'To use this page, all you have to do is scroll, and if you see an event that you want you press \'Join Event\'.'),
        ],
      ),
      body: Column(
        children: <Widget>[
          _tileBuild(context),
        ],
      ),
    );
  }

  Widget _iconCheck(String event) {
    if (event.contains('Monthly')) {
      event = event.substring(0, 7);
    }
    if (widget._iconsMap.containsKey(event)) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(widget._iconsMap[event]),
      );
    }
    return Container();
  }

  Widget delEvent(BuildContext context, Map<List<dynamic>, DateTime> _reversed, List<dynamic> event) {
    if (globals.admin) {
      return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        onPressed: () async {
          loaded = null;
          setState(() {});
          await EventDB().delEvents(_reversed[event], event);
          _events = await EventDB().getEvents();
          loaded = true;
          setState(() {});
        },
        child: Text(
          'Delete Events',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
    return Container();
  }

  Widget _tileBuild(BuildContext context) {
    var _listTest = _events.values.toList();
    // var _list = _listTest.expand((list) => list).toList(); // Flattens the list.
    Map<List<dynamic>, DateTime> _reversed = _events.map((k, v) => MapEntry(v, k));
    // var _datesTest = _reversed.values.toList();

    return Expanded(
      child: ListView(
        children: _listTest
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
                            _iconCheck(event.join(', ')),
                            Expanded(
                              child: Container(
                                child: Text(
                                  event.join(', 1'),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text('Date: ' +
                            DateFormat('yyyy-MM-dd').format(_reversed[event])),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            delEvent(context, _reversed, event),
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
}