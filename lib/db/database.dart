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

  Future login(String email, String password) async {
    final dummy = await loginCollection.document(email).get();
    dynamic data = dummy.data;

    if(password == data['password']) {
      
    }
    
  }
}
