import 'package:cloud_firestore/cloud_firestore.dart';

class AttendenceDB {
  final CollectionReference attendenceCollection =
      Firestore.instance.collection('attendence');

  final CollectionReference submitCollection =
      Firestore.instance.collection('submitedAttendence');

  List<Map<String, dynamic>> students = [];
  List<Map<String, dynamic>> students2 = [];

  Future addStudent(String name) async {
    return await attendenceCollection.document(name).setData({
      'name': name,
      'present': false,
    });
  }

  Future deleteStudent(String name) async {
    return await attendenceCollection.document(name).delete();
  }

  Future updateStudent(String name, bool val) async {
    return await attendenceCollection.document(name).setData({
      'name': name,
      'present': val,
    });
  }

  Future getStudents() async {
    await attendenceCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        students.add({
          'name': f.data['name'],
          'present': f.data['present'],
        });
      });
    });
    return students;
  }

  Future submitAttendence(String date) async {
    await attendenceCollection.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) async {
        students.add({
          'name': f.data['name'],
          'present': false,
        });
        students2.add({
          'name': f.data['name'],
          'present': f.data['present'],
        });
        await attendenceCollection.document(f.data['name']).setData({
          'name': f.data['name'],
          'present': false,
        });
      });
    });
    await submitCollection.document(date).setData({'attendence': students2});
    return students;
  }
}
