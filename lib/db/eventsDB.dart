import 'package:cloud_firestore/cloud_firestore.dart';

class EventDB {
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  Map<DateTime, List> events = {};
  var date;

  Future getEvents() async {
    await eventCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        date = f.data['date'].toDate();
        events[date] = f.data['events'];
      });
    });
    return events;
  }

  Future addEvent(DateTime date, List<dynamic> events) async {
    return await eventCollection
        .document(date.toString().split(' ')[0])
        .setData({
      'date': date,
      'events': events,
    });
  }

  // Future delEvent() {}

  Map<DateTime, List> _events = { // Used for DB reseting
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
    DateTime(2020, 1, 17): ['District Award Ceremony'],
    DateTime(2020, 3, 12): ['State Leadership Conference'],
    DateTime(2020, 3, 13): ['State Leadership Conference'],
    DateTime(2020, 3, 14): ['State Leadership Conference'],
    DateTime(2020, 3, 15): ['State Leadership Conference'],
    DateTime(2020, 6, 29): ['National Leadership Conference'],
    DateTime(2020, 6, 30): ['National Leadership Conference'],
    DateTime(2020, 7, 1): ['National Leadership Conference'],
    DateTime(2020, 7, 2): ['National Leadership Conference'],
  };

  void updateEvents() async { // Use only when DB need reseting
    _events.forEach((k, v) {
      eventCollection.document(k.toString().split(' ')[0]).setData({
        'date': k,
        'events': v,
      });
    });
  }
}
