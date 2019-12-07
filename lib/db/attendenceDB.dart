import 'package:cloud_firestore/cloud_firestore.dart';

class AttendenceDB {
  final CollectionReference attendenceCollection =
      Firestore.instance.collection('attendence');

  List<Map<String, dynamic>> students = [];

  Future addStudent(String name) async {
    return await attendenceCollection.document(name).setData({
      'name': name,
      'present': false,
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
}
