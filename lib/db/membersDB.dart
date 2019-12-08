import 'package:cloud_firestore/cloud_firestore.dart';

class MembersDB {
  final CollectionReference memberCollection =
      Firestore.instance.collection('member');

  Future signUp(String email, String name, String grade, String size,
      String topic) async {
    return await memberCollection.document(email).setData({
      'email': email,
      'name': name,
      'grade': grade,
      'size': size,
      'topic': topic,
    });
  }

  
}
