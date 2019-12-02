library fbla.globals;

import 'dart:io';
import 'package:path_provider/path_provider.dart';

String name = 'Student';
String email = '';
String password = '';

Map<String, Map<String, String>> accounts = {
  'johndoe@example.com': {'John Doe': 'johndoe123'},
  'janedoe@exmaple.com': {'Jane Doe': 'janedoe123'},
};

String getUserName(String email, String password) {
  String _userName = 'Student';

  if (accounts.containsKey(email)) {
    Map<String, String> _foo1 = accounts[email];
    Map<String, String> _foo2 = _foo1.map((k, v) => MapEntry(v,
        k)); // reverses the key : value into value : key, so name:password into password:name
    if (_foo2.containsKey(password)) {
      _userName = _foo2[password];
    }
  }

  return _userName;
}

bool isAccount(String email, String password) {
  if (accounts.containsKey(email)) {
    Map<String, String> _foo1 = accounts[email];
    Map<String, String> _foo2 = _foo1.map((k, v) => MapEntry(v,
        k)); // reverses the key : value into value : key, so name:password into password:name
    if (_foo2.containsKey(password)) {
      return true;
    }
  }

  return false;
}

// Get the directory of file.
Future<String> get _localPath async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}
