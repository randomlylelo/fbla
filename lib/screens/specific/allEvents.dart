import 'package:flutter/material.dart';

// Widget used to display all the events
class AllEvent extends StatelessWidget {
  final Map<DateTime, List> _events;
  final Map<String, IconData> _iconsMap;

  AllEvent(this._events, this._iconsMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Events'),
      ),
      body: Column(
        children: <Widget>[
          _tileBuild(context),
        ],
      ),
    );
  }

  Widget _iconCheck(String event) {
    if (_iconsMap.containsKey(event)) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Icon(_iconsMap[event]),
      );
    }
    return Container();
  }

  Widget _tileBuild(BuildContext context) {
    var _listTest = _events.values.toList();
    var _list = _listTest.expand((list) => list).toList(); // Flattens the list.

    return Expanded(
      child: ListView(
        children: _list
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
    );
  }
}
