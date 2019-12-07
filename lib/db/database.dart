import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference loginCollection =
      Firestore.instance.collection('logins');

  Future register(String email, String name, String password) async {
    return await loginCollection.document(email).setData({
      'name': name,
      'password': password,
      'admin': true,
    });
  }

  Future<bool> check(String email) async {
    final dummy = await loginCollection.document(email).get();
    if(dummy == null || !dummy.exists) {
      return false;
    }
    return true;
  }

  Future<bool> login(String email, String password) async {
    // return true if login successful else false
    final dummy = await loginCollection.document(email).get();
    dynamic data = dummy.data;

    if(password == data['password']) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getName(String email) async {
    final dummy = await loginCollection.document(email).get();
    dynamic data = dummy.data;
    return data['name'];
  }
}
